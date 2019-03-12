# frozen_string_literal: true

module ApplicationHelper
  # application_helper.rb
  def default_meta_tags
    {
      site: "Meister Hackers",
      title: "",
      description: "description",
      reverse: true,
      separator: "|",
      og: defalut_og,
      twitter: default_twitter_card
    }
  end

  private

    def defalut_og
      {
        title: :full_title,          # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
        description: "本物の仲間達と市場価値を高め合う、エンジニア達のプラットフォーム",   # 上に同じ
        url: "https://meister-hackers.herokuapp.com",
        image: "https://example.com/hoge.png"
      }
    end

    def default_twitter_card
      {
        card: "summary_large_image", # または summary
        site: "@PROs08364820", # twitter ID
        url: "https://meister-hackers.herokuapp.com",
        title: "Meister Hackers title",
        description: "本物の仲間達と市場価値を高め合う、エンジニア達のプラットフォーム",
        image: "https://github.com/WEBsinjyuku/meister-hackers/blob/master/public/Meister%20Hackers.png"
      }
    end
  end
