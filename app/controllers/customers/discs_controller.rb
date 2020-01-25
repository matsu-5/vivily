class Customers::DiscsController < ApplicationController
  def index
  	@disc = Disc.all
  	@categories = Category.all
  end

  def show
  	@disc = Disc.find(params[:id])
  end

  def category
    @category = Category.find(params[:id])
    @discs = Disc.where(category_id: @category.id)
    @categories = Category.all
  end
end
