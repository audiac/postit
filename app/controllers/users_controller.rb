class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully created an account"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account updated successfully."
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end
end