# frozen_string_literal: true

class MessagesController < ApplicationController
  protect_from_forgery except: ["create"]

  def index
    post = Post.find_by(id: params[:post_id])
    if post
      render json: { status: 200, data: post.messages, signed_in: user_signed_in? }
    else
      render json: { status: 500, data: [], signed_in: user_signed_in? }
    end
  end

  def create
    post = Post.find_by(id: params[:post_id])

    unless post.present?
      render json: { status: 500 }
      return
    end

    message = post.messages.build(content: params[:content], user_id: current_user[:id])

    if message.save
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end
end
