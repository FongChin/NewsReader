class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user!(@user)
      redirect_to feeds_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
  end

  # def feeds
  #
  # end
end
