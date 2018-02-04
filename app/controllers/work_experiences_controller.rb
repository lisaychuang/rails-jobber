class WorkExperiencesController < ApplicationController
  before_action :require_login
  
  def index
    @user = current_user
    @user_experiences = @user.work_experiences.order(ranking: :asc)
  end

  def new
  end

  def show
    @experience = WorkExperience.find_by(id: params[:id])
  end

  def edit
    @experience = WorkExperience.find_by(id: params[:id])
  end

  def update
    @experience = WorkExperience.find_by(id: params[:id])
    if @experience.update(experience_params)
        redirect_to user_path(@experience)
    else
        redirect_to edit_user_path
    end
  end

  private 
    
  
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
  end
end
