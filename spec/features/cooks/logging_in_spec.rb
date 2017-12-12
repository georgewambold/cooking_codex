require 'rails_helper'

feature "user logging in" do
  scenario "with valid data" do
    existing_cook = Cook.new(email: 'cook@martha.com', password: 'asdf123')

    visit 'cooks/sign_in'
    fill_in('Email', :with => 'cook@martha.com')
    fill_in('Password', :with => 'asdf123')
    find('input[name="commit"]').click

    expect(page).to have_content('LaBounta Recipies')
  end
end
