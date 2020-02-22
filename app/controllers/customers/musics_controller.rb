class Customers::MusicsController < ApplicationController
  def show
  	@music = Music.find(params[:id])
  	@comment = Comment.new #①
    @comments = @music.comments #②
  end

  def index
  	@music = Music.all
  	@music = Music.page(params[:page]).per(8).order(created_at: "DESC")
  end
end
