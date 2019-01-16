module ApplicationHelper

  # TODO: ログイン機能実装後変更  
  def current_student
    User.find(1)
  end

  def logged_in?
    !session[:user_id].nil?
  end
end
