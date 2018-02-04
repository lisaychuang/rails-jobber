class WorkExperiencesController < ApplicationController
  before_action :require_login
  
  def index
    @user_experiences = current_user.work_experiences
    # @user_experiences = @experiences.select{ |exp| exp.user_id = }
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
