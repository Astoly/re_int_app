class RequestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @request = current_user.requests.build
  end

  def my_requests #Es sollen alle Requests des users angezeigt werden. Neuste zuerst  
    if current_user
     @requests = current_user.requests
    end
  end

  def open_requests
    #Show Request that have less than 2 Readings; oldest on top
    # @open_requests = Requests.all
    @requests = Request.all
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
      render "requests/new"
    end
  end

  private
  def request_params 
    params.require(:request).permit(:content, :avatar)
  end
end
