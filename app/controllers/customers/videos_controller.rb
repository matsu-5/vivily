class Customers::VideosController < ApplicationController
  def show
  	@video = Video.find(params[:id])
  end

  def index
  	@video = Video.all
  	@video = Video.page(params[:page]).per(8).order(created_at: "DESC")
  end
end
