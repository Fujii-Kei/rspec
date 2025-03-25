require 'rails_helper'

RSpec.describe Task, type: :model do
  it "タイトルがあれば有効である" do
    task = Task.new(title: "サンプルタスク")
    expect(task).to be_valid
  end

  it "タイトルがないと無効である" do
    task = Task.new(title: nil)
    expect(task).to be_invalid
  end
end
