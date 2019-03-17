# frozen_string_literal: true

class MessagesController < ApplicationController
  protect_from_forgery except: ["create"]

  def index
    messages = Message.joins("LEFT JOIN users ON messages.user_id = users.id").where(post_id: params[:post_id])
      .select("messages.id, messages.user_id, users.avatar_url, users.name, messages.content, messages.created_at")
    
    if user_signed_in?
      logged_in_user_id = current_user[:id]
    else
      logged_in_user_id = -1
    end

    if messages
      render json: { status: 200, data: messages, signed_in: user_signed_in?, logged_in_user_id: logged_in_user_id }
    else
      render json: { status: 500, data: [], signed_in: user_signed_in?, logged_in_user_id: logged_in_user_id }
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
      user = User.find_by(id: message.user_id)
      render json: { status: 200, data: [ message: message, user: user] }
    else
      render json: { status: 500 }
    end
  end

  def destroy
    message = Message.find_by(id: params[:id])
    if message.delete
      render json: { status: 200 }
    else
      render json: { status: 500 }
    end
  end
end
