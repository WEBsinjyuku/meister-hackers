class Message < ApplicationRecord
  belongs_to :post
  validates :context, length: { maximum: 100 }, presence: true
end
