# deviseを使ったログイン機能のrspecを作成する
require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users/sign_in" do
    let(:user) { create(:user) }

    it "ユーザーがログインできる" do
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to have_http_status(:see_other)
    end
  end
end
