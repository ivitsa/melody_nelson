class GalleryController < ApplicationController
  def index
  end

  def editimages
  	  @photos = Photo.all
  end

  def edit
  	  @photo = Photo.find(params[:id])
  end

  def update
  	  if request.patch?  

  	  	  if  @photo = Photo.update(photo_params) 
  	  	  	  flash[:notice]="Photo successfully updated"
  	  	  else
  	  	  	  flash[:notice]="Error! Could not update photo"
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
  	  params.require(:photo).permit(:description, :position, :image)
  end
end
