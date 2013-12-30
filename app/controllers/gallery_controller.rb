class GalleryController < ApplicationController
	before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy, :editimages]
  def index
  	  @photos = Photo.all.order('position ASC')
  	  @first=1;
  end

  def editimages
  	  @photos = Photo.paginate(:page => params[:page], :per_page => 9).order('position ASC')
  end

  def edit
  	  @photo = Photo.find(params[:id])
  end

  def update
  	  @photo = Photo.find(params[:id])
  	  if request.patch?  
  	  	 if params[:photo][:image].blank?
  	  	 	if  @photo.update_attributes(:description=>params[:photo][:description], :position=>params[:photo][:position]) 
  	  	  		flash[:notice]="Photo successfully updated"
  	  	  	else
  	  	  		flash[:notice]="Error! Could not update photo"
  	  	  	end
  	  	 else
  	  	 	 if  @photo.update(photo_par) 
				  flash[:notice]="Photo successfully updated"
			 else
				  flash[:notice]="Error! Could not update photo"
			 end
		 end
  	  	  redirect_to action: "editimages"
  	  end
  end

  def new
  	  @photo = Photo.new
  end

  def create
  	  if request.post?
  	  	  @photo = Photo.new(photo_params)
  	  	  if  @photo.save
  	  	  	  flash[:notice]="Photo successfully added"
  	  	  else
  	  	  	  flash[:notice]="Error! Could not add photo"
  	  	  end
  	  	  redirect_to action: "editimages"
  	  end
  end

  def destroy
  	  @photo = Photo.find(params[:id])
  	  if @photo.destroy
  	  	  flash[:notice]="Photo successfully deleted"
  	  else
  	  	  flash[:notice]="Error! Could not delete photo"
  	  end
  	  redirect_to action: "editimages" 
  end
  
  private
  def photo_params
  	  params.require(:photo).permit(:id, :description, :position, :image)
  end
end
