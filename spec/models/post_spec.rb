# frozen_string_literal: true

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
