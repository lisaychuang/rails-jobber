class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    binding.pry
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
        redirect_to edit_user_path
    end
  end

  private 
    
    
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
  end

end
