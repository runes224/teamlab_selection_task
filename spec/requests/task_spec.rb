require 'rails_helper'

describe 'Tasks API', type: :request do
  describe 'GET /tasks' do
    it '全てのタスクを取得する' do
      create_list(:task, 10)

      get '/tasks'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'GET /tasks/:id' do
    it '特定のタスクを取得する' do
      task = create(:task, title: 'タスクタイトル', body: 'タスク説明')

      get "/tasks/#{task.id}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 特定のタスクが返されたか確認する。
      expect(json['data']['title']).to eq(task.title)
      expect(json['data']['body']).to eq(task.body)
    end
  end

  describe 'POST /tasks' do
    it '新しいタスクを作成する' do
      valid_params = {title: 'タスクタイトル', body: 'タスク説明'}

      # データが作成されていることを確認
      expect {post '/tasks', params: {task: valid_params}}.to change(Task, :count).by(+1)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end
  end

  describe 'PUT /tasks/:id' do
    it 'タスクの編集を行う' do
      task = create(:task, title: 'タスクタイトル(旧)', body: 'タスク説明(旧)')

      put "/tasks/#{task.id}", params: {task: {title: 'タスクタイトル(新)', body: 'タスク説明(新)'}}
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      #データが更新されている事を確認
      expect(json['data']['title']).to eq('タスクタイトル(新)')
      expect(json['data']['body']).to eq('タスク説明(新)')
    end
  end

  describe 'DELETE /tasks/:id' do
    it 'タスクの削除を行う' do
      task = create(:task)

      #データが削除されている事を確認
      expect {delete "/tasks/#{task.id}"}.to change(Task, :count).by(-1)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
    end
  end
end
