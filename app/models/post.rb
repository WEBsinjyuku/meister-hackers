# frozen_string_literal: true

class Post < ApplicationRecord
  enum status: { wanted: 1, stopped: 2 }
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :repository, presence: true

  before_save :format_repository_url

  def format_repository_url
    self.repository.gsub!(/https:\/\/github.com/, '')
  end
end
