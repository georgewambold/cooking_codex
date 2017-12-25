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
      log_in_as_cook

      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it "passes the recipe_params to Recipe" do
      log_in_as_cook

      post :create, params: { recipe: { title: 'spagetti' } }

      assert_redirected_to Recipe.last
    end

    it 're-renders the recipes#new page if there are errors' do
      log_in_as_cook

      post :create, params: { recipe: { summary: 'foo' } }

      expect(response).to render_template(:new)
    end
  end

  describe '#show' do
    it 'uses the recipe show decorator' do
      recipe = Recipe.create(title: 'foo')
      allow(RecipeShowDecorator).to receive(:decorate)

      get :show, params: { id: recipe.id }

      expect(RecipeShowDecorator).to have_received(:decorate)
        .with(recipe)
    end
  end

  describe '#edit' do
    it 'uses the recipe edit decorator' do
      log_in_as_cook
      recipe = Recipe.create(title: 'foo')
      allow(RecipeEditDecorator).to receive(:decorate)

      get :edit, params: { id: recipe.id }

      expect(RecipeEditDecorator).to have_received(:decorate)
        .with(recipe)
    end
  end

  describe '#update' do
    it 'uses the recipe show decorator' do
      log_in_as_cook
      recipe = Recipe.create(title: 'foo')

      post :update, params: { id: recipe.id, recipe: { title: 'spoon' } }

      expect(Recipe.find(recipe.id).title).to eq('spoon')
    end

    it 'uses the recipe show decorator' do
      log_in_as_cook
      recipe = Recipe.create(title: 'foo')

      post :update, params: { id: recipe.id, recipe: { title: 'bar' } }

      expect(Recipe.find(recipe.id).title).to eq('bar')
    end
  end

  def log_in_as_cook
    cook = double('cook')
    allow(controller).to receive(:authenticate_cook!).and_return(cook)
  end
end
