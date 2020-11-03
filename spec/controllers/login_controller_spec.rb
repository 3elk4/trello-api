require 'rails_helper'

RSpec.describe LoginController, type: :controller do

  describe "GET #authenticate" do
    it "returns http success" do
      get :authenticate
      expect(response).to have_http_status(:success)
    end
  end

end
