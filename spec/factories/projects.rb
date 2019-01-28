# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    repository { "OSS-ruby" }
    post { create(:post) }
  end
end
