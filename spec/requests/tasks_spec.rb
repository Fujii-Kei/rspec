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
  describe "POST /tasks" do
    it "新しいタスクを作成できる" do
      task_params = { task: { title: "新しいタスク" } }
      
      post tasks_path, params: task_params
      
      expect(response).to have_http_status(:created)
      expect(Task.last.title).to eq("新しいタスク")
    end
  end
end
