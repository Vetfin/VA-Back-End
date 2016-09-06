class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email:  params[:user][:email])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id # Actually log in
      redirect_to user_home_path, notice: "You have succesfully logged in"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
