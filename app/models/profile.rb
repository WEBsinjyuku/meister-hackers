# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  area         :string
#  sex          :string
#  github_url   :string
#  twitter_url  :string
#  facebook_url :string
#  blog_url     :string
#  introduction :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class Profile < ApplicationRecord
  INVALID_URL_FROMAT = "URLの形式が不正です"
  belongs_to :user

  validates :github_url, allow_blank: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: INVALID_URL_FROMAT }
  validates :twitter_url, allow_blank: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: INVALID_URL_FROMAT }
  validates :facebook_url, allow_blank: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: INVALID_URL_FROMAT }
  validates :blog_url, allow_blank: true, format: { with: /\A#{URI::regexp(%w(http https))}\z/, message: INVALID_URL_FROMAT }
end
