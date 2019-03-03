# frozen_string_literal: true

module ApplicationHelper
  def get_status_name(status)
    status_name = ""
    case status
    when status.wanted?
      status_name = "【募集中】"
    when status.stopped?
      status_name = "【募集終了】"
    else
    end
    status_name
  end
end
