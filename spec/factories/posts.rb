# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  content    :text             not null
#  user_id    :bigint(8)        not null
#  repository :string           not null
#


FactoryBot.define do
  factory :post do
    title { "post" }
    content { "testtesttesttesttesttesttesttesttesttest" }
    repository { "repo_name" }
    association :user
  end
end
