class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories

  attachment :image

  validates_presence_of :title, :directions, :ingredients
end
