class RequestsController < ApplicationController
  before_action :authenticate_user!

def new
    @request = current_user.requests.build
  end

 def show
    #@requests = Request.all
    #@user = User.find(params[:id])
    @request = Request.find(params[:id])
    @requests = Request.all
    #@requests = @user.requests.paginate(page: params[:page])
    @readings = Reading.all#.paginate(page: params[:page])
    @reading  = current_user.readings.build
    @rating   = current_user.ratings.build

  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.save
      #flash[:success] = "Reading Request created!"
      redirect_to @request, notice: "Reading created"
    else
      #render 'pages/inside'
      #redirect_to root_url
      flash[:alert] = "Content and picture can´t be empty."
      @requests = []
      render "pages/inside"
    end
  end

  private
  def request_params 
    params.require(:request).permit(:content, :avatar)
  end
end
