# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  provider               :string           default(""), not null
#  uid                    :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  avatar_url             :string           not null
#  nickname               :string           default(""), not null
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(github)

  has_many :posts, dependent: :destroy
  has_one :profile, dependent: :destroy

  scope :get_repo_name, -> (user_id, repository) { select("nickname || '/' || '#{repository}' AS repo_name").find(user_id).repo_name }

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_github_oauth(auth, signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    unless user
      user = User.new(
        provider:     auth.provider,
        uid:          auth.uid,
        name:         auth.info.name,
        nickname:     auth.info.nickname,
        email:        auth.info.email,
        avatar_url:   auth.info.image,
        password:     Devise.friendly_token[0, 20],
        confirmed_at: Time.zone.now
      )
    end
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
