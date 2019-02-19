# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    content { "こんにちは" }
    association :post
  end
end
