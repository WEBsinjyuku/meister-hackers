# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i(edit update)
  before_action :only_logged_in_user, only: %i(new create edit update)
  before_action :only_author, only: %i(edit update)

  def index
    repo1 = {
      'id' => 1,
      'title' => 'Vue.js入門',
      'language' => 'JavaScript',
      'topics' => ['eslint', 'eslint-plugin', 'html', 'javascript', 'npm', 'npm-module', 'npm-package', 'static-analysis', 'vue'],
      'description' => 'Official ESLint plugin for Vue.js',
      'stargazers_count' => 2259
     }
     repo2 = {
      'id' => 2,
      'title' => '【駆け出しエンジニア向け】DevMeets開発者募集！！',
      'language' => 'Rails',
      'stargazers_count' => 10
     }

    @repos = [repo1, repo2]
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
end
