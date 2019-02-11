# frozen_string_literal: true

module GithubOss
  class GithubFetcher
    def initialize(repo_name)
      @repo_name = repo_name
    end

    def language
      repo[:language]
    end

    def languages
      @languages ||= Octokit.languages @repo_name
    end

    def topics
      @topics ||= Octokit.topics @repo_name
    end

    def description
      repo[:description]
    end

    def stargazers_count
      repo[:stargazers_count]
    end

    def collaborators
      @collab ||= Octokit.collaborators @repo_name
    end

    private
      attr_reader :repo

      def repo
        @repo ||= fetch_repo
      end

      def fetch_repo
        Octokit.repo @repo_name
      rescue StandardError => e
        # エラー処理はとりあえずログするだけにしておく
        logger.error(e)
        {}
      end
  end
end
