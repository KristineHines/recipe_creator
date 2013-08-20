class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  has_many :measurements, :through => :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients
  has_many :directions

  accepts_nested_attributes_for :ingredients, :measurements, :recipe_ingredients, :directions
end
