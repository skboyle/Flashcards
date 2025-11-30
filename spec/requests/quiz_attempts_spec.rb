require 'rails_helper'

RSpec.describe "QuizAttempts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/quiz_attempts/show"
      expect(response).to have_http_status(:success)
    end
  end

end
