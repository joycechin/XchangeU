class UsersController < ApplicationController
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
	  flash[:success] = "Welcome to Xchange-u!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
end
