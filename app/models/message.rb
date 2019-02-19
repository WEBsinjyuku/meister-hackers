# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :post
  validates :content, length: { maximum: 100 }, presence: true
end
