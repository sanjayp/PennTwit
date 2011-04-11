class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.firstname
  end
  
  def profile
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to PennTwit"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

end
