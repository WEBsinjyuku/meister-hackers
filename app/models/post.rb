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
#  status     :integer          not null, default: 1


class Post < ApplicationRecord
  enum status: { wanted: 1, stopped: 2 }
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :repository, presence: true

  before_save :format_repository_url

  def format_repository_url
    self.repository.gsub!(/https:\/\/github.com/, "")
  end

end
