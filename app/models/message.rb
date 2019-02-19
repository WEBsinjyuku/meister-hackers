# frozen_string_literal: true

# == Schema Information
#
# Table name: messages
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  post_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Message < ApplicationRecord
  belongs_to :post
  validates :content, length: { maximum: 100 }, presence: true
end
