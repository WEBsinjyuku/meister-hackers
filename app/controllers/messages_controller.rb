# frozen_string_literal: true

class MessagesController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    if post
      render json: { status: 200, data: post.messages }
    else
      render json: { status: 500 }
    end
  end

  def create
  end
end
