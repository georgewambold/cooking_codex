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

    expect(page).to have_content('Recipe Title')
    expect(page).to have_content("can't be blank")
  end

  scenario 'adding a recipe with ingredients and directions', js: true do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes/new')
    fill_in('Recipe Title', with: 'pasta')
    find('.ingredient-button').click
    all('.ingredient-name-input')[0].set('flour')
    all('.ingredient-amount-input')[0].set('2 cups')
    find('.ingredient-button').click
    all('.ingredient-name-input')[1].set('eggs')
    all('.ingredient-amount-input')[1].set('8')
    find('.direction-button').click
    all('.direction-description-input')[0].set('mix ingredients')
    find('.direction-button').click
    all('.direction-description-input')[1].set('bake')
    click_button('Create recipe!')

    expect(page).to have_content('flour')
    expect(page).to have_content('2 cups')
    expect(page).to have_content('eggs')
    expect(page).to have_content('8')
    expect(page).to have_content('mix ingredients')
    expect(page).to have_content('bake')
  end
end
