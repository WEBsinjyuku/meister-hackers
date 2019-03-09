# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update destroy)
  before_action :only_logged_in_user, only: %i(new create edit update)
  before_action :only_author, only: %i(edit update)

  def index
    @posts = search_posts
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
    @post = Post.find(params[:id])
    client = GithubOss::GithubFetcher.new(@post.owner_and_repository)

    @user = User.find(@post.user_id)
    @git = {
      "language" => client.language,
      "topics" => client.topics.names,
      "description" => client.description,
      "stargazers_count" => client.stargazers_count
    }
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "投稿を削除しました"
    else
      render :show
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :repository, :status, :slack_channel)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def only_logged_in_user
      redirect_to root_path, notice: "ログインしてください" unless user_signed_in?
    end

    def only_author
      redirect_to root_path, notice: "権限がありません" unless current_user == @post.user
    end

    def search_posts
      posts = []
      Post.order("id").select() do |repo|
        client = GithubOss::GithubFetcher.new(repo.owner_and_repository)
        post = {
          "id" => repo.id,
          "url" => "/posts/#{ repo.id }",
          "title" => repo.title,
          "language" => client.language,
          "topics" => client.topics.names,
          "description" => client.description,
          "stargazers_count" => client.stargazers_count,
          "status" => repo.status
        }
        posts.push(post)
      end
      posts
    end
end
