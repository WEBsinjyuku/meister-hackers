# frozen_string_literal: true

module ApplicationHelper
  # application_helper.rb
  def default_meta_tags
    {
      site: 'Meister Hackers',
      reverse: true,
      separator: '|',
      og: defalut_og,
      twitter: default_twitter_card
    }
  end

  private

    def defalut_og
      {
        title: :full_title,          # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
        description: :description,   # 上に同じ
        url: request.url,
        image: 'https://example.com/hoge.png'
      }
    end

    def default_twitter_card
      {
        card: 'summary_large_image', # または summary
        site: '@hogehoge'            # twitter ID
      }
    end

  end
