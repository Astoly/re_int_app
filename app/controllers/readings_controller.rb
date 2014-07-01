class ReadingsController < ApplicationController
  before_action :authenticate_user!

  def show
    # @request = Request.find(params[:id])
    @reading = Reading.find(params[:id])
    @readings = Reading.all
    # @request = Request.all
    # @readings = Reading.all#.paginate(page: params[:page])
    # @reading = current_user.readings.build
    
    @rating = current_user.ratings.build
    # @ratings = Rating.all
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

  private
  def reading_params    
    params.require(:reading).permit(:content, :request_id)
  end
end
