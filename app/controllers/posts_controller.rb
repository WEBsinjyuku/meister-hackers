# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :only_logged_in_user, only: %i(new create edit update)
  before_action :only_author, only: %i(edit update)

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿を作成しました"
    else
      render :new
    end
  end

  def edit
    @post = find_post
  end

  def update
    @post = find_post
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :repository)
    end

    def find_post
      Post.find_by(id: params[:id])
    end

    def only_logged_in_user
      redirect_back fallback_location: root_url unless logged_in?
    end

    def only_author
      redirect_back fallback_location: root_url unless current_user == @post.user
    end
end
