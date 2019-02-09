# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { "post" }
    content { "testtesttesttesttesttesttesttesttesttest" }
    repository { "repo_name" }
    user { create(:user) }
  end
end
