require 'rails_helper'

feature 'viewing the recipies index' do
  scenario 'when there are no recipies' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes')

    expect(page).to have_content('There are currently no recipes in the system! Click to add one!')
  end

  scenario 'when a recipe exists' do
    cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')
    create_recipe_for(cook)

    login_as(cook, scope: :cook)
    visit('/recipes')

    expect(page).to have_content("Spagetti")
  end

  def create_recipe_for(cook)
    Recipe.new.tap do |recipe|
      image = Image.create(file: File.new("#{Rails.root}/spec/fixtures/files/test.png"))

      recipe.title = 'Spagetti'
      recipe.cook  = cook
      recipe.recipe_category = RecipeCategory.create(name: 'breakfast')
      recipe.images << image
      recipe.primary_image_id = image.id
    end.save
  end
end
