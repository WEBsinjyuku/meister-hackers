# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update)
  before_action :only_logged_in_user, only: %i(new create edit update)
  before_action :only_author, only: %i(edit update)

  def index
    # 今は空メソッドで定義
  end

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
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def show

  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :repository)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def only_logged_in_user
      redirect_back fallback_location: root_url unless logged_in?
    end

    def only_author
      redirect_back fallback_location: root_url unless current_user == @post.user
    end
end
