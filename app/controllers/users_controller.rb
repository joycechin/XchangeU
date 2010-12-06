class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
	  @title = @user.name
  end
  
  def new
    @user = User.new
  	@title = "Register"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
	    flash[:success] = "Welcome to Xchange-u!"
      redirect_to @user
    else
      @title = "Register"
      @user.password =""
      @user.password_confirmation =""
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title ="Edit user"
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User destroyed"
    redirect_to users_path
  end
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end
  
end
