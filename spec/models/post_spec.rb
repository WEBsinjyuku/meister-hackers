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
#

require "rails_helper"

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  context "error" do
    it "title が空" do
      post.title = ""
      expect(post).not_to be_valid
    end

    it "title が50文字より長い" do
      post.title = "a" * 51
      expect(post).not_to be_valid
    end

    it "content が空" do
      post.content = ""
      expect(post).not_to be_valid
    end

    it "repository が空" do
      post.repository = ""
      expect(post).not_to be_valid
    end

    it "user_id が空" do
      post.user_id = nil
      expect(post).not_to be_valid
    end
  end

  context "not error" do
    it do
      expect(post).to be_valid
    end
  end
end
