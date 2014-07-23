class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
    :inside
  ]

  def home
  end
  
  def inside
  	@request = current_user.requests.build
  	@requests = Request.all
  end 

  def about
  end
    
end
