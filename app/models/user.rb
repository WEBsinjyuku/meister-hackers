# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end
