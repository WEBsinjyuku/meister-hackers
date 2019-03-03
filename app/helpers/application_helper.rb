# frozen_string_literal: true

module ApplicationHelper
  def get_status_name(status)
    message = ""
    case status
    when status.wanted?
      message = "【募集中】"
    when status.stopped?
      message = "【募集終了】"
    else
    end
    message
  end
end
