class UsersController < ApplicationController

  def create
    @user = Search.create(user_params)
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

end
