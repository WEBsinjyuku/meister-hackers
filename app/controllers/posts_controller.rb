# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update)
  before_action :only_logged_in_user, only: %i(new create edit update)
  before_action :only_author, only: %i(edit update)

  def index
    search_posts 
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

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def show
    # 今は空メソッドで定義
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

    def search_posts
      repos = ["vuejs/vue", "dh-megane/DesignPTN"]
      cnt = 0
      posts = []
      repos.each do |repo|
        client = GithubOss::GithubFetcher.new(repo)
        post = {
          'id' => cnt += 1,
          'title' => 'タイトル' + cnt.to_s,
          'language' => client.language,
          #'topics' => client.topics,
          'description' => client.description,
          'stargazers_count' => client.stargazers_count
        }
        posts.push(post)
      end
      @posts = posts
    end
end
