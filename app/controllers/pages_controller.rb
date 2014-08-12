class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def home
  end
  
  def inside
  	@request = current_user.requests.build
  	@requests = Request.all.page params[:page]
    @open_requests = Request.all
    #@requests = Request.order(:name).page params[:page]
  end 

  def about
  end
    
end
