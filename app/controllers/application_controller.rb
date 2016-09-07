class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper_method :current_user
  def current_user(token)
    User.find_by(token: token)
  end
end
