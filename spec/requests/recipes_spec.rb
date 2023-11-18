require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET recipes#index' do
    before(:each) do
      user = User.create name: 'Test user', email: 'test@example.com', password: 'password'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipes_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('Add new recipe')
    end
  end

  describe 'GET /show' do
    before(:each) do
      user = User.create name: 'Test user', email: 'test@example.com', password: 'password'
      recipe = Recipe.create(name: 'Test recipe', cooking_time: 2, prepraration_time: 10,
                             description: 'Test description', public: true, user:)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipe_path(recipe.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders correct content' do
      expect(response.body).to include('Preparation time:')
      expect(response.body).to include('Cooking time:')
      expect(response.body).to include('Description:')
    end
  end
end
