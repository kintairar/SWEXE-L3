class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(tdate: :desc)
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    message = params[:tweet][:message]
    tdate = Time.current
    @tweet = Tweet.new(message: message, tdate: tdate)
    if @tweet.save
      redirect_to '/'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/'
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end


  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    message = params[:tweet][:message]
    tdate = @tweet.tdate
    @tweet.update(message: message, tdate: tdate)
    redirect_to '/'
  end
end