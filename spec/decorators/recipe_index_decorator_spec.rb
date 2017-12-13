require 'rails_helper'

describe RecipeIndexDecorator do
  it 'has a valid cook_name value' do
    mock_cook   = double(:cook, first_name: 'fred')
    mock_recipe = double(:recipe, cook: mock_cook)

    decorated_recipe = RecipeIndexDecorator.new(mock_recipe)

    expect(decorated_recipe.cook_name).to eq('fred')
  end
end
