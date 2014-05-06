class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url= Url.new params[:url]
    if @url.save
      redirect_to urls_path
    else
      session[:errors] = @url.errors.messages.values
      render :new
    end
  end

  def show
    url = Url.find(params[:id])
    url.update_attribute(:click_count, url.click_count + 1)
    redirect_to url.long_url
  end
end