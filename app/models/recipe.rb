class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories

  attachment :image

  scope :unsorted, -> { where(archived: false).select { |x| x.categories.empty? } }

  validates_presence_of :title, :directions, :ingredients
end
