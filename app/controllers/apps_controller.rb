class AppsController < ApplicationController

  before_filter :signed_in_user,	only: [:index, :show]
  before_filter :admin_user,   		only: [:create, :edit, :update, :destroy]

  def index
    @apps = App.paginate(page: params[:page])
  end

  def show
    @app = App.find(params[:id])
  end

  def new
      @app = App.new
  end

  def create
     @app = App.new(params[:app])
     if @app.save
        flash[:success] = "App saved!"
        redirect_to @user
     else
        flash[:error] = "Couldn't save app."
        render 'new'
     end
  end

  def edit
      @app = App.find(params[:id])
  end

  def update
    if @app.update_attributes(params[:app])
      	flash[:success] = "App updated"
      	redirect_to @apps_path
    else
      	flash[:error] = "Couldn't update app."
      	render 'edit'
    end
  end

  def destroy
  	@app = App.find(params[:id])
    if @app.destroy
      	flash[:success] = "App destroyed."
      	redirect_to apps_path
    else
      	flash[:error] = "Couldn't delete app."
      	redirect_to apps_path
    end
  end

  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
    