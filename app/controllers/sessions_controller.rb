# frozen_string_literal: true

class SessionsController < ApplicationController
  # TODO: ログイン機能実装後削除
  def test
  end

  # TODO: ログイン機能実装後削除
  def login_dev
    session[:user_id] = 1 unless session[:user_id]
    redirect_to root_url
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, notice: "ログアウト"
  end
end
