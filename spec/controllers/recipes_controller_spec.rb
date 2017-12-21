require 'rails_helper'


RSpec.describe RecipesController, type: :controller do
  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "calls RecipeIndexDecorator#decorate_collection with all recipes" do
      recipe = Recipe.create(title: 'spagetti')
      allow(RecipeIndexDecorator).to receive(:decorate_collection)
        .and_call_original

      get :index

      expect(RecipeIndexDecorator).to have_received(:decorate_collection)
        .with([recipe])
    end
  end

  describe '#new' do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it "passes the recipe_params to Recipe" do
      allow(Recipe).to receive(:create).and_call_original

      post :create, params: { recipe: { title: 'spagetti' } }

      expect(Recipe).to have_received(:create)
        .with(an_instance_of(ActionController::Parameters))
    end

    it 'redirects to the newly created recipe if there are no errors' do
      post :create, params: { recipe: { title: 'spagetti' } }
      recipe = Recipe.find_by(title: 'spagetti')

      expect(:foo).to redirect_to(recipe)
    end

    it 'redirects to the newly created recipe if there are no errors' do
      post :create, params: { recipe: { title: 'spagetti' } }
      recipe = Recipe.find_by(title: 'spagetti')

      expect(:foo).to redirect_to(recipe)
    end

    xit 're-renders the recipes#new page if there are errors' do
      post :create, params: { recipe: { title: nil } }

      expect(:foo).to have_rendered(:new)
    end
  end
end
