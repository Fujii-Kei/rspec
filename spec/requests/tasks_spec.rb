require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "タスクの一覧を取得できる" do
      task = Task.create!(title: "テストタスク")
      get tasks_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(task.title)
    end
  end
end
