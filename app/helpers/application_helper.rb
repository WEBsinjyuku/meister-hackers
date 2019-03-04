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
    end
    status_name
  end
end
