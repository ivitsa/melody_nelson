class ContactsController < ApplicationController
  def index
  	  @contact=Contact.first	  	  
  end

  def new
  	  if @contact=Contact.first
  	  	  flash[:notice]="Contact information has been added already. You can edit or reset it."
  	  	  redirect_to action: "index"
  	  else
  	  	  @contact=Contact.new
  	  end
  end

  def create
  	  if request.post?
  	  	  @contact = Contact.new(contact_params)
  	  	  if  @contact.save
  	  	  	  flash[:notice]="Contact information successfully added"
  	  	  else
  	  	  	  flash[:notice]="Error! Could not add contact information"
  	  	  end
  	  	  redirect_to action: "index"
  	  end
  end

  def edit
  	  @contact=Contact.find(params[:id])
  end

  def update
    	  @contact=Contact.find(params[:id])
  	  if request.patch?
  	  	  if @contact.update(contact_params)
  	  	  	  flash[:notice]="Contact information successfully updated."
  	  	  else
  	  	  	  flash[:notice]="Error! Could not update contact information."
  	  	  end
  	  	  redirect_to action: "index"
  	  end	  
  end

  def destroy
  	  @contact = Contact.find(params[:id])
  	  if @contact.destroy
  	  	  flash[:notice]="Contact information successfully reset."
  	  else
  	  	  flash[:notice]="Error! Could not reset contact information"
  	  end
  	  redirect_to action: "index"  	
  end
  
  private
  def contact_params
  	  params.require(:contact).permit(:name, :address, :phone, :email, :opening_hours, :facebook)
  end
end
