class ReadingsController < ApplicationController
  before_action :authenticate_user!
  #before_filter :require_permission, only: :show

  def index
    if current_user
     @readings = current_user.readings
    end
  end


  def show
    #@request = Request.find(params[:reading][:request_id])
    @reading = Reading.find(params[:id])
    @rating = current_user.ratings.build
  end

  def create
   #@request = Request.find(params[:id])
   @request = Request.find(params[:reading][:request_id])
   @reading = current_user.readings.build(reading_params)
   
   # @request = @reading.post
    if @reading.save
      redirect_to @request, notice: "Reading successfully created." 
    else
      flash[:alert] = "Content can´t be empty."
      redirect_to @request      
    end
  end

  def destroy
  end

  def require_permission
    if current_user != Request.find(params[:reading][:request_id]).user 
      redirect_to inside_path
      flash[:alert] =  "This Reading is private." 
      #Or do something else here
    end
  end

  private
  def reading_params    
    params.require(:reading).permit(:content, :request_id)
  end
end
