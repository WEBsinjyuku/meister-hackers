# frozen_string_literal: true

class PostValidator < ActiveModel::Validator
  REPOSITORY_FORMAT = "リポジトリの形式が不正です"
  REPOSITORY_EXISTENCE = "存在するリポジトリを入力して下さい"

  def validate(record)
    record.validates_presence_of :repository, :title, :content, :slack_url
    record.validates_length_of :title, maximum: 50
    record.validates_length_of :content, maximum: 1000

    url_splits = record.repository.split("/")

    if url_splits[-2].nil?
      record.errors[:base] << REPOSITORY_FORMAT if !record.repository.blank?
      return record
    end

    client = GithubOss::GithubFetcher.new(url_splits[-2] + "/" + url_splits[-1])

    if !client.repository?
      record.errors[:base] << REPOSITORY_EXISTENCE if !record.repository.blank?
      return record
    end
    record
  end
end
