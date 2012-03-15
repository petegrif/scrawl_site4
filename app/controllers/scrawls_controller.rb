class ScrawlsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @scrawl = current_user.scrawls.build(params[:scrawl])
    if @scrawl.save
      flash[:success] = "Scrawl created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @scrawl.destroy
    redirect_back_or root_path
  end

  private

    def correct_user
      @scrawl = current_user.scrawl.find_by_id(params[:id])
      redirect_to root_path if @scrawl.nil?
    end
  
end