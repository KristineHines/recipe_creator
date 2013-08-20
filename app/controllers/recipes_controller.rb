class RecipesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @recipes = Recipe.find_by_user_id(params[:user_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new

    5.times do
      recipe_ingredient = @recipe.recipe_ingredients.build
      recipe_ingredient.ingredient = @recipe.ingredients.build
      recipe_ingredient.measurement = @recipe.measurements.build
    end

  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
    p @recipe.recipe_ingredients
    redirect_to user_recipe_path(current_user, @recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, 
      recipe_ingredients_attributes: [:id, :ingredient_id, :measurement_id, :user_id, :amount,
      ingredient_attributes: [:id, :name],
      measurement_attributes: [:id, :name]])
  end
end