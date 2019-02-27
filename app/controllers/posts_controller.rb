# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update)
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
    post = Post.find(params[:id])
    client = GithubOss::GithubFetcher.new(User.get_repo_name(post.user_id, post.repository))

    @post = post
    @user = User.find(post.user_id)
    @git = {
      "language" => client.language,
      "topics" => client.topics.names,
      "description" => client.description,
      "stargazers_count" => client.stargazers_count
    }
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :repository, :status)
    end

    def set_post
      @post = Post.find_by(id: params[:id])
    end

    def only_logged_in_user
      redirect_back fallback_location: root_url unless user_signed_in?
    end

    def only_author
      redirect_back fallback_location: root_url unless current_user == @post.user
    end

    def search_posts
      posts = []
      Post.order("id").select() do |repo|
        repo_name = User.get_repo_name(repo.user_id, repo.repository)
        client = GithubOss::GithubFetcher.new(repo_name)
        post = {
          "id" => repo.id,
          "url" => "/posts/#{ repo.id }",
          "title" => repo.title,
          "language" => client.language,
          "topics" => client.topics.names,
          "description" => client.description,
          "stargazers_count" => client.stargazers_count
        }
        posts.push(post)
      end
      posts
    end
end
