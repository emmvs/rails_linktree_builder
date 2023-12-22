require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /error" do
    it "returns http success" do
      get "/static/error"
      expect(response).to have_http_status(:success)
    end
  end

end
