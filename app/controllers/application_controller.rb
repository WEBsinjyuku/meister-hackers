# frozen_string_literal: true

class ApplicationController < ActionController::Base
  if Rails.env == "production"
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from Exception, with: :render_500
  end

  def render_404
    render template: "errors/error_404", status: 404, layout: "application", content_type: "text/html"
  end

  def render_500
    render template: "errors/error_500", status: 500, layout: "application", content_type: "text/html"
  end
end
