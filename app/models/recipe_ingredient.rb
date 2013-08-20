class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measurement

  accepts_nested_attributes_for :ingredient, :measurement
end