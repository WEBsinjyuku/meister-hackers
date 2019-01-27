# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }

  context "error" do
    it "repository が空" do
      project.repository = ""
      expect(project).not_to be_valid
    end
  end

  context "not error" do
    it do
      expect(project).to be_valid
    end
  end
end
