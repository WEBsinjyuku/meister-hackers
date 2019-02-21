# frozen_string_literal: true

class ProfilesController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    if user
      render json: { status: 200, proile: user.profile, username: user.name }
    else
      render json: { status: 500 }
    end
  end

  def edit
  end
end
