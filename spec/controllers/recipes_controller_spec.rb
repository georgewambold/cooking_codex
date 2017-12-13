require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "#index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "calls RecipeIndexDecorator#decorate_collection with all recipies" do
      recipe = Recipe.create(title: 'spagetti', recipe_category_id: 1)
      allow(RecipeIndexDecorator).to receive(:decorate_collection)
        .and_call_original

      get :index

      expect(RecipeIndexDecorator).to have_received(:decorate_collection)
        .with([recipe])
    end
  end

end
