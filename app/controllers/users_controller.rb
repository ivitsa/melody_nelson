class UsersController < ApplicationController
	before_filter :require_user, :only => [:index, :show, :edit, :update, :new, :create]
  
  def index
  	  if current_user.is_admin==0
  	  	  flash[:notice]="Only admins can see this page"
  	  	  redirect_to root_url
  	  else
  	  	  @users = User.all
  	  end
  end  

  
	
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
    	    @user = current_user
  end

  def edit
    if current_user.is_admin==1
    	    @user = User.find(params[:id])
    else
    	    @user = current_user
    end
  end
  
  def update
    if current_user.is_admin==1
    	    @user = User.find(params[:id])
    else
    	    @user = current_user
    end
    if @user.update_attributes(user_params)
      flash[:notice] = "User updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  def destroy
  	if current_user.is_admin==1
  	  	@user = User.find(params[:id])
  	  	if @user==current_user
  	  		flash[:notice]="Can't delete yourself"
  	  	else
  	  		if @user.destroy
  	  			flash[:notice]="User successfully deleted"
  	  		else
  	  			flash[:notice]="Error! Could not delete user"
  	  		end
		end
		redirect_to action: "index"
  	else
  		flash[:notice]="Only admins can delete users"
		redirect_to root_url
  	end
  end
  
  private

  def user_params
    params.require(:user).permit(:login, :email, :password, :password_confirmation, :is_admin)
  end
end
