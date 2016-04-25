class Recipe < ActiveRecord::Base
  before_save :compile

  validates_presence_of :title, :instructions

  def compile
    write_attribute(:compiled_instructions, Kramdown::Document.new(instructions).to_html)
  end
end
