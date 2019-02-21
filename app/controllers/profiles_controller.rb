# frozen_string_literal: true

class ProfilesController < ApplicationController
  protect_from_forgery except: ["update"]

  def index
    user = User.find_by(id: params[:user_id])
    if user
      render json: { status: 200, profile: user.profile, username: user.name, id: user.id }
    else
      render json: { status: 500 }
    end
  end

  def update
    profile = Profile.find_by(id: params[:id])
    if profile
      attributes = {
        area: params[:area],
        sex: params[:sex],
        github_url: params[:github_url],
        twitter_url: params[:twitter_url],
        facebook_url: params[:facebook_url],
        blog_url: params[:blog_url],
        introduction: params[:introduction]
      }
      profile.update!(attributes)
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end
end
