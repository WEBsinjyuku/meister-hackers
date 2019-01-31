# frozen_string_literal: true
class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :omniauthable, :confirmable, omniauth_providers: %i(google facebook github)

def self.create_unique_string
    SecureRandom.uuid
end

def self.find_for_github_oauth(auth, signed_in_resource=nil)
user = User.find_by(provider: auth.provider, uid: auth.uid)

unless user
 user = User.new(provider: auth.provider,
                 uid:      auth.uid,
                 name:     auth.info.name,
                 email:    User.dummy_email(auth),
                 password: Devise.friendly_token[0, 20]
 )
end
    user.save
    user
end

def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
end

end
