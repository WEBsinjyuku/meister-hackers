# frozen_string_literal: true

module GithubOss
  class GithubFetcher
    def initialize(repo)
      @repo = repo
    end

    private

      def repo
        @repo ||= fetch_repo
      end

      def fetch_repo
        Octokit.repo @repo
      rescue StandardError => e
        # エラー処理はとりあえずログするだけにしておく
        logger.error(e)
        {}
      end
  end
end
