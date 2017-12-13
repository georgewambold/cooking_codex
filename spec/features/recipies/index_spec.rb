require 'rails_helper'

feature 'viewing the recipies index' do
  scenario 'when there are no recipies' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes')

    expect(page).to have_content('There are currently no recipes in the system! Click to add one!')
  end

  scenario 'when a recipe exists' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')
    existing_recipe = Recipe.create(title: "Spagetti", recipe_category_id: 1)

    login_as(existing_cook, scope: :cook)
    visit('/recipes')

    expect(page).to have_content("Spagetti")
  end
end
