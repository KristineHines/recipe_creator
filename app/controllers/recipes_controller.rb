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
    recipe_ingredient = @recipe.recipe_ingredients.build
    recipe_ingredient.ingredient = @recipe.ingredients.build
    recipe_ingredient.measurement = @recipe.measurements.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
    redirect_to user_recipe_path(current_user, @recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, 
      ingredients_attributes: [:id, :name],
      measurements_attributes: [:id, :name], 
      recipe_ingredients_attributes: [:id, :ingredient_id, :measurement_id, :user_id, :amount])
  end
end