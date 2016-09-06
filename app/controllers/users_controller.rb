class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def login
    @user = User.find_by(params[:email])
    redirect_to user_path(@user.id)
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

end
