class PostValidator < ActiveModel::Validator

  def validate(record)
    record.validates_presence_of :repository, :title, :content
    record.validates_length_of :title, maximum: 50
    record.validates_length_of :content, maximum: 1000

    url_splits = record.repository.split("/")

    if !url_splits[-2].nil?
      client = GithubOss::GithubFetcher.new(url_splits[-2]+"/"+url_splits[-1])
      if client.repository? #GitHubのリポジトリが存在するかチェック
        record
      else
        record.errors[:base] << "存在するリポジトリを入力して下さい"
      end
    else
      record.errors[:base] << "存在するリポジトリを入力して下さい" if !record.repository.blank?
    end
  end

end
