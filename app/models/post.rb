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
#  status     :integer          default("wanted"), not null
#  owner      :string
#

class Post < ApplicationRecord
  enum status: { wanted: 1, stopped: 2 }
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :repository, presence: true

  before_save :format_repository

  def owner_and_repository
    [owner, repository].join("/")
  end

  def format_repository
    url_splits = self.repository.split("/")
    if !url_splits[-2].nil? # 仮対応
      self.owner = url_splits[-2]
      self.repository = url_splits[-1]
    end
  end
end
