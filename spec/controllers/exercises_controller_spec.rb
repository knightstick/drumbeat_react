require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  let(:exercise) { create(:exercise) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: exercise.id
      expect(response).to have_http_status(:success)
    end
  end

end
