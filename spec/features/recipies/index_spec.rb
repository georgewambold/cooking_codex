require 'rails_helper'

feature 'viewing the recipies index' do
  scenario 'when there are no recipies' do
    existing_cook = Cook.create(email: 'cook@martha.com', password: '12345asdf')

    login_as(existing_cook, scope: :cook)
    visit('/recipes')

    expect(page).to have_content('No recipies yet! Add one!')
  end
end
