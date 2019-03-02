# frozen_string_literal: true

module ApplicationHelper
  def get_status_name(status)
    message = ""
    case status
    when "wanted"
      message = "【募集中】"
    when "stopped"
      message = "【募集終了】"
    else
    end
    message
  end
end
