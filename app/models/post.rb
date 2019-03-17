# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id            :bigint(8)        not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string           not null
#  content       :text             not null
#  user_id       :bigint(8)        not null
#  repository    :string           not null
#  status        :integer          default("wanted"), not null
#  owner         :string           not null
#  opened_on     :date
#  closed_on     :date
#  slack_channel :string
#  bosyu_type    :integer          default("soft")
#

class Post < ApplicationRecord
  include ActiveModel::Validations

  enum status: { wanted: 1, stopped: 2 }
  enum bosyu_type: { soft: 1, hard: 2 }

  belongs_to :user
  has_many :messages, dependent: :destroy

  validates_with PostValidator, field: [:repository, :title, :content]

  before_save :format_repository, :update_date

  def owner_and_repository
    [owner, repository].join("/")
  end

  def format_repository
    url_splits = self.repository.split("/")
    self.owner = url_splits[-2]
    self.repository = url_splits[-1]
  end

  def update_date
    if self.wanted?
      self.opened_on = Date.today
      self.closed_on = nil
    elsif self.stopped?
      self.closed_on = Date.today
    end
  end
end
