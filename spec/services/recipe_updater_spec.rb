require 'rails_helper'

describe RecipeUpdater do
  it 'updates a recipe without any association changes' do
    recipe = Recipe.create(title: 'penne')

    updated_recipe = RecipeUpdater.new(recipe: recipe, recipe_params: valid_recipe_params).execute

    expect(updated_recipe).to have_attributes(valid_recipe_params)
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

  it 'accepts nested params for associations' do
    recipe = Recipe.create(title: 'calzone')
    recipe_category = RecipeCategory.create(name: 'dinner')

    updated_recipe = RecipeUpdater.new(recipe: recipe, recipe_params: valid_association_params(recipe_category)).execute

    binding.pry
    expect(updated_recipe.ingredients).to
  end

  def valid_association_params(recipe_category)
    {
      title: 'pizza',
      recipe_category_id: recipe_category.id,
      recipe_ingredients_attributes: [
        amount: '1',
        ingredients_attributes: [ name: 'foo' ],
      ],
      directions_attributes: [
        { step_number: 1, description: 'do stuff' }
      ],
    }
  end
end
