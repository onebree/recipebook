class Recipe < ActiveRecord::Base
  before_save :compile

  has_and_belongs_to_many :categories

  attachment :image

  validates_presence_of :title, :directions

  def compile
    write_attribute(:compiled_ingredients, Kramdown::Document.new(ingredients).to_html)
    write_attribute(:compiled_directions, Kramdown::Document.new(directions).to_html)
    write_attribute(:compiled_notes, Kramdown::Document.new(notes).to_html)
  end
end
