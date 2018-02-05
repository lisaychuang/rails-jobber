class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
  end

  def new 
    if current_user
      @user = current_user
      render 'show'
    else
      @user = User.new
      render 'new'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_update_params)
        redirect_to user_path(@user)
    else
      # If there are errors
      @user.errors.full_messages.each do |msg|
        puts "ERRORS: " + msg
      end
      redirect_to edit_user_path
    end
  end

  private 
    
    
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
