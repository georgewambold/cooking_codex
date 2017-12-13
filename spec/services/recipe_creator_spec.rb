require 'rails_helper'

describe RecipeCreator do
  it 'takes params for a recipe' do
    recipe = RecipeCreator.new(recipe_params: valid_recipe_params).execute

    expect(recipe).to have_attributes(valid_recipe_params)
  end

  def valid_recipe_params
    {
      title: 'spagetti',
      summary: 'some_summary',
      yield: 'enough for 5 people',
      prep_time: '10 mins',
      cooking_time: '5 mins',
      recipe_category_id: 1
    }
  end

  it 'accepts nested params for ingredients' do
    recipe = RecipeCreator.new(recipe_params: valid_ingredient_params).execute
    ingredients = recipe.ingredients

  end

  def valid_ingredient_params
    {
      title: 'pizza',
      ingredients: [
        name: 'foo',
        amount: '1'
      ]
    }
  end
end
