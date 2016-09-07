class SessionsController < ApplicationController


  def create
    @user = User.find_by(email:  params[:user][:email])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id # Actually log in
      render json: @user
    else
      render json: {} , status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You have successfully logged out"}, status: :ok
  end

end
