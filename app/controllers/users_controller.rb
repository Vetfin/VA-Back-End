class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unauthorized
    end
  end

  def show
    @user = User.find(params[:id])
    @condos = @user.condos
  end

  def login
    @user = User.find_by(params[:email])
    # redirect_to user_path(@user.id)
    render json: @user
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
