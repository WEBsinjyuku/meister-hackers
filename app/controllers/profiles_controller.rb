# frozen_string_literal: true

class ProfilesController < ApplicationController
  protect_from_forgery except: [:update]
  before_action :set_user, only: [:index, :index2]

  def index
    if @user
      render json: { status: 200, profile: @user.profile, username: @user.name, avatar: @user.avatar_url, id: @user.id, is_login: user_signed_in?, is_current_user: current?, nickname: @user.nickname }
    else
      render json: { status: 500 }
    end
  end

  def index2
    if current?
      render json: { status: 200, profile: @user.profile, username: @user.name, avatar: @user.avatar_url, id: @user.id, is_login: user_signed_in?, is_current_user: current?, nickname: @user.nickname }
    else
      render json: { status: 401 }
    end
  end

  def update
    if params[:id] == "undefined"
      profile = Profile.new

      profile.area = params[:area]
      profile.sex = params[:sex]
      profile.github_url = params[:github_url]
      profile.twitter_url = params[:twitter_url]
      profile.facebook_url = params[:facebook_url]
      profile.blog_url = params[:blog_url]
      profile.introduction = params[:introduction]
      profile.user_id = params[:user_id]

      if profile.save
        render json: { status: 200 }
      else
        render json: { status: 500 }
      end
    else
      profile = Profile.find_by(id: params[:id])

      attributes = {
        area: params[:area],
        sex: params[:sex],
        github_url: params[:github_url],
        twitter_url: params[:twitter_url],
        facebook_url: params[:facebook_url],
        blog_url: params[:blog_url],
        introduction: params[:introduction]
      }
      if profile.update(attributes)
        render json: { status: 200 }
        flash[:notice] = "編集に成功しました"
      else
        render json: { status: 500 }
      end
    end
  end

  private
    def set_user
      @user = User.find_by(id: params[:user_id])
    end

    def current?
      @user.present? && current_user.present? && current_user.id == @user.id
    end
end
