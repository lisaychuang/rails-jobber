class WorkExperiencesController < ApplicationController
  before_action :require_login, :current_user
  
  def index
    @user = User.find_by(id: params[:user_id])
      @user_experiences = @user.work_experiences.order(ranking: :asc)
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
      @experience = WorkExperience.new(user_id: params[:user_id])
    end
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @experience = @user.work_experiences.new(experience_params)
    if @experience.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @experience = WorkExperience.find_by(id: params[:id])
  end
  
  def edit
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "User not found."
      else
        @experience = @user.work_experiences.find_by(id: params[:id])
        redirect_to user_work_experiences_path(@user), alert: "Work experience not found." if @experience.nil?
      end
    else
      @experience = WorkExperience.find(params[:id])
    end
  end

  def update
    @user = User.find_by(id: params[:user_id])
    @experience = @user.work_experiences.find_by(id: params[:id])
    if @experience.update(experience_update_params)
        redirect_to user_work_experience_path(@user, @experience)
    else
        redirect_to edit_user_work_experience_path(@user, @experience)
    end
  end

  private 
    
  
  def experience_update_params
      params.require(:work_experience).permit(:employer, :title, :location, :start_date, :end_date, :experience, :ranking)
  end

  def experience_params
    params.require(:work_experience).permit(:user_id, :employer, :title, :location, :start_date, :end_date, :experience, :ranking)
  end

end
