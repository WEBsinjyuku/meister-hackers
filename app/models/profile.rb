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
  INVALID_URL_FORMAT = "%<field>s URLの形式が不正です"
  MAX_LENGTH_ERROR = "%<field>sは、%<length>s文字以内で入力して下さい"
  belongs_to :user

  validates :area, length: { maximum: 9, message: MAX_LENGTH_ERROR % { field: "都道府県", length: 9 } }
  validates :sex, length: { maximum: 5, message: MAX_LENGTH_ERROR % { field: "性別", length: 5 } }
  validates :introduction, length: { maximum: 500, message: MAX_LENGTH_ERROR % { field: "自己紹介", length: 500 } }
  validates :github_url, allow_blank: true, format: { with: /\A#{URI.regexp(%w(http https))}\z/, message: INVALID_URL_FORMAT % { field: "GitHub" } }, length: { maximum: 2000, message: MAX_LENGTH_ERROR % { field: "GitHub URL", length: 2000 } }
  validates :twitter_url, allow_blank: true, format: { with: /\A#{URI.regexp(%w(http https))}\z/, message: INVALID_URL_FORMAT % { field: "Twitter" } }, length: { maximum: 2000, message: MAX_LENGTH_ERROR % { field: "Twitter URL", length: 2000 } }
  validates :facebook_url, allow_blank: true, format: { with: /\A#{URI.regexp(%w(http https))}\z/, message: INVALID_URL_FORMAT % { field: "Facebook" } }, length: { maximum: 2000, message: MAX_LENGTH_ERROR % { field: "Facebook URL", length: 2000 } }
  validates :blog_url, allow_blank: true, format: { with: /\A#{URI.regexp(%w(http https))}\z/, message: INVALID_URL_FORMAT % { field: "Blog" } }, length: { maximum: 2000, message: MAX_LENGTH_ERROR % { field: "Blog URL", length: 2000 } }
end
