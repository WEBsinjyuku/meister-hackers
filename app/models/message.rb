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
#  user_id    :bigint(8)
#


class Message < ApplicationRecord
  MAX_LENGTH_ERROR = "%<field>sは、%<length>s文字以内で入力して下さい"
  belongs_to :post

  validates :content, length: { maximum: 100, message: MAX_LENGTH_ERROR % { field: "コメント", length: 100 } }, presence: true
end
