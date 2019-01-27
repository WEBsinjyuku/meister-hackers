# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :post

  validates :repository, presence: true
end
