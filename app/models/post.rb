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


class Post < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :repository, presence: true
end
