class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    p params
    @url= Url.new params[:url]
    if @url.save
      redirect_to urls_path
    else
      render :new
    end
  end
end