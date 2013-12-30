class UsersController < ApplicationController
	before_filter :require_user, :only => [:show, :edit, :update, :new, :create]
  
  def new
        if(current_user.is_admin==1)
  	  	@user = User.new
  	else 
  		flash[:notice]="Only admin users can add new users"
  		redirect_to root_url
  	end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_back_or_default root_url
    else
      flash[:notice] = "User not created"
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(user_params)
      flash[:notice] = "Updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, :is_admin)
  end
end
