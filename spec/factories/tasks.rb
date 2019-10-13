# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :task do
    sequence(:title) {|n| "タスクタイトル_#{n}"}
    sequence(:body) {|n| "タスク本文_#{n}"}
  end
end