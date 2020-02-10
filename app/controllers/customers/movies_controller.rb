class Customers::MoviesController < ApplicationController
  def show
  	@movie = Movie.find(params[:id])
  end

  def index
  	@movie = Movie.all
  	@movie = Movie.page(params[:page]).per(8).order(created_at: "DESC")
  end
end
