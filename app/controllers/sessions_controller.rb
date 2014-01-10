class SessionsController < ApplicationController
  def create
    @user = User.find_by_credential(params[:user])
    if @user
      log_in_user!(@user)
      redirect_to feeds_url
    else
      flash[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def new

  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end
end
