module SessionsHelper
  # TODO: ログイン機能実装後変更
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
