require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { create(:user) }
  let!(:task) { create(:task, user: user, title: "テストタスク") }

  describe "GET /tasks" do
    context "ログインしている場合" do
      before { sign_in user }


      it "タスクの一覧にアクセスできる" do
        get tasks_path
        expect(response).to have_http_status(:ok)
        expect(response.body).to include(task.title)
      end
    end

    context "ログインしていない場合" do
      it "タスクの一覧にアクセスできない" do
        get tasks_path
        expect(response).to have_http_status(:found)
      end
    end
    # describe "POST /tasks" do
    #   it "新しいタスクを作成できる" do
    #     task_params = { task: { title: "新しいタスク" } }

    #     post tasks_path, params: task_params

    #     expect(response).to have_http_status(:created)
    #     expect(Task.last.title).to eq("新しいタスク")
    #   end
    # end
    # describe "GET /tasks/:id" do
    #   it "指定したタスクを取得できる" do
    #     task = Task.create!(title: "特定のタスク")

    #     get task_path(task)

    #     expect(response).to have_http_status(:ok)
    #     expect(response.body).to include(task.title)
    #   end
    # end
    # describe "PATCH /tasks/:id" do
    #   it "指定したタスクを更新できる" do
    #     task = Task.create!(title: "元のタイトル")
    #     updated_params = { task: { title: "更新後のタイトル" } }

    #     patch task_path(task), params: updated_params

    #     expect(response).to have_http_status(:ok)
    #     expect(task.reload.title).to eq("更新後のタイトル")
    #   end
    # end
    # describe "DELETE /tasks/:id" do
    #   it "指定したタスクを削除できる" do
    #     task = Task.create!(title: "削除されるタスク")

    #     delete task_path(task)

    #     expect(response).to have_http_status(:no_content)
    #     expect(Task.exists?(task.id)).to be_falsey
    #   end
  end
end
