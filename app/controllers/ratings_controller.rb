class RatingsController < ApplicationController
  before_action :authenticate_user!
#   before_filter :require_permission, only: :create

# def require_permission
#   if current_user == Request.find(params[:request_id]).user
#     # redirect_to root_path
#     #Or do something else here
#   end
# end

  def create
    # @rating = current_user.ratings.build(request_params)
    # # @reading = Reading.find(params[:reading_id])
    # @rating.reading_id = Reading.find(params[:reading_id])

    @reading = Reading.find(params[:rating][:reading_id])
    @rating = current_user.ratings.build(rating_params)
    
    if @rating.save
      #flash[:success] = "Reading Request created!"
      redirect_to @reading, notice: "Thank you // Rating saved"
    else
      #render 'pages/inside'
      #redirect_to root_url

      # flash[:alert] = "Please fill in all ratings"
      # @requests = []
      # render "pages/inside"
      flash[:alert] = "Rating not saved. Please use Rating 1-5."
      redirect_to @reading
    end
  end

  private
  def rating_params 
    params.require(:rating).permit(:score01, :score02, :score03, :score04, :score05, :reading_id)
  end
end
