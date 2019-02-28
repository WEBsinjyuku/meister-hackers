# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string           default(""), not null
#  uid                    :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  avatar_url             :string           not null
#  nickname               :string           default(""), not null
#

FactoryBot.define do
  factory :user do
    sequence (:name) { |n| "tsu-nera#{n}" }
    sequence(:email) { |n| "example#{n}@gmail.com" }
    avatar_url { "https://github.com/tsu-nera.png" }
    password { "helloworld" }
    avatar_url { "sample_url" }
    sequence(:uid) { |n| n }
    provider { "github" }
  end
end
