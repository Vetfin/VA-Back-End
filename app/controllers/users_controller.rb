class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.token = SecureRandom.hex

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unauthorized
    end
  end

  def login
    @user = User.find_by(email:  params[:user][:email])

    if @user.authenticate(params[:user][:password])
      # session[:user_id] = @user.id # Actually log in
      render json: @user
    else
      render json: {} , status: :unauthorized
    end
  end

  def show
    @user = User.find(params[:id])
    @condos = @user.condos
  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
