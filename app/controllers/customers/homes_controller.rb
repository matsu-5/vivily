class Customers::HomesController < ApplicationController
  def about
  end

  def biography
  end

  def top
  end

  def top_second
  	@information = Information.all.order(created_at: :desc).limit(3)
  	@live = Live.all.order(created_at: :desc).limit(3)
  	@video = Video.all.order(created_at: :desc).limit(1)
    @disc = Disc.all
  end

  def top_third
  	@topics = Topic.all.order(created_at: :desc).limit(3)
  	@movie = Movie.all.order(created_at: :desc).limit(1)
  	@blog = Blog.all.order(created_at: :desc).limit(3)
  end

  def category
    @category = Category.find(params[:id])
    @discs = Disc.where(category_id: @category.id)
    @categories = Category.all
  end
end
