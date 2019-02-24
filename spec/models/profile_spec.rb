# frozen_string_literal: true

# == Schema Information
#
# Table name: profiles
#
#  id           :bigint(8)        not null, primary key
#  area         :string
#  sex          :string
#  github_url   :string
#  twitter_url  :string
#  facebook_url :string
#  blog_url     :string
#  introduction :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


require "rails_helper"

RSpec.describe Profile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
