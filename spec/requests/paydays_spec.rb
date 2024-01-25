require 'rails_helper'

RSpec.describe "Paydays", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/paydays/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/paydays/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/paydays/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
