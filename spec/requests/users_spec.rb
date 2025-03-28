#deviseを使ったログイン機能のrspecを作成する
require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users/sign_in" do
    let(:user) { User.create!(email: "test@test.com", password: "tttttt", password_confirmation: "tttttt") }

    it "ユーザーがログインできる" do
      post user_session_path, params: { user: { email: user.email, password: "tttttt" } }
      
      expect(response).to have_http_status(:see_other)
    end
  end
end
