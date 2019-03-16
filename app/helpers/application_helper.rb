# frozen_string_literal: true

module ApplicationHelper
  def get_status_name(status)
    status_name = ""
    case status
    when "wanted"
      status_name = "【募集中】"
    when "stopped"
      status_name = "【募集終了】"
    else
      status_name
    end
    status_name
  end


  def default_meta_tags
   {
    site: "Meister Hackers",
    title: "",
    description: "本物の仲間達と市場価値を高め合う、エンジニア達のプラットフォーム",
    reverse: true,
    separator: "|",
    og: defalut_og,
    twitter: default_twitter_card,
   }
  end

  private

    def defalut_og
     {
      title: :full_title,
      description: :description,
      url: "https://meister-hackers.herokuapp.com",
      image: "https://github.com/WEBsinjyuku/meister-hackers/blob/master/public/Meister%20Hackers.png"
     }
    end

    def default_twitter_card
     {
      card: "summary_large_image",
      site: "",
      url: "https://meister-hackers.herokuapp.com",
      title: "Meister Hackers",
      description: "本物の仲間達と市場価値を高め合う、エンジニア達のプラットフォーム",
      image: "https://github.com/WEBsinjyuku/meister-hackers/blob/master/public/Meister%20Hackers.png"
     }
    end
end
