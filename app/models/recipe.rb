class Recipe < ActiveRecord::Base
  before_save :compile

  has_and_belongs_to_many :categories

  attachment :image

  validates_presence_of :title, :instructions

  def compile
    write_attribute(:compiled_instructions, Kramdown::Document.new(instructions).to_html)
  end
end
