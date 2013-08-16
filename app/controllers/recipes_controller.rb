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
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :user_id, ingredients_attributes: [:id, :name],
        measurement_attributes: [:id, :name], recipe_ingredients_attributes: [:id, :amount])
  end
end