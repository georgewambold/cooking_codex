require 'rails_helper'

feature 'creating a new recipe' do
  scenario 'navigating to the new recipe page' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/')
    click_link('Submit Recipe')

    expect(page).to have_content('New Recipe')
  end

  scenario 'adding a valid recipe' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes/new')
    fill_in('Recipe Title', with: 'pasta')
    click_button('Create recipe!')

    expect(page).to have_content('pasta')
  end

  scenario 'adding an invalid recipe' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes/new')
    click_button('Create recipe!')

    expect(page).to have_content('Recipe Title', "can't be blank")
  end

  scenario 'adding a recipe with ingredients and directions' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes/new')
    fill_in('Recipe Title', with: 'pasta')
    fill_in('recipe[ingredients][][name]', with: 'flour')
    fill_in('recipe[ingredients][][amount]', with: '2 cups')
    click_button('Create recipe!')

    expect(page).to have_content('flour', '2 cups')
  end
end
