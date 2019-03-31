# frozen_string_literal: true

class HomeController < ApplicationController
  def top
    if user_signed_in?
      redirect_to root_path
    end
  end
end
