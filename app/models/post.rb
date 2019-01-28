# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one :project, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
