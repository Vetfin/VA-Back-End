class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    @condos = User.condos
  end

  def login
    @user = User.find_by(params[:email])
    # redirect_to user_path(@user.id)
    render json: @user
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

end
