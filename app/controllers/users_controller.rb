class UsersController < ApplicationController
  # ログインユーザーしかみられないように実装
  def show
    # @user = User.find(params[:id])
    # →Couldn't find User without an IDエラーで動かない
    # @user = User.find_by(id: params[:id])
    # →undefined method `name' for nil:NilClass
    @user = User.find_by(params[:id])
    # このの書き方だと動くがidが常に1のユーザーになる。id２のユーザーでログインしても同じid:
    # @user = User.all
    # →これは問題なく表示される
  end
end
