class Admin::HomesController < ApplicationController
  def topic
    @information = Information.all
    @information = Information.page(params[:page]).per(4).order(created_at: "DESC")
    @topics = Topic.all
    @topics = Topic.page(params[:page]).per(4).order(created_at: "DESC")
  end

  def movie
  	@video = Video.all
    @video = Video.page(params[:page]).per(6).order(created_at: "DESC")
  	@movie = Movie.all
    @movie = Movie.page(params[:page]).per(6).order(created_at: "DESC")
  end

  def music
  	@disc = Disc.all
    @disc = Disc.page(params[:page]).per(6).order(created_at: "DESC")
  	@music = Music.all
    @music = Music.page(params[:page]).per(6).order(created_at: "DESC")
    @category = Category.new
    @categories = Category.all
  end

  def category
    @category = Category.find(params[:id])
    @discs = Disc.where(category_id: @category.id)
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_homes_music_path
  end

  def live
    @live = Live.all
    @live = Live.page(params[:page]).per(14).order(created_at: "DESC")
  end

  def top_second
  end
end
