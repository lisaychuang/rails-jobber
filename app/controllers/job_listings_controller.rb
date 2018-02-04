class JobListingsController < ApplicationController
  before_action :require_login
  
  def index
    @listings = JobListing.all
  end

  def new
  end

  def show
    @listing = JobListing.find_by(id: params[:id])
  end

  def edit
  end
end
