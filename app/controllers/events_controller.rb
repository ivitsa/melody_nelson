class EventsController < ApplicationController
  def index
  	  @events=Event.all
  end

  def edit
  	  @event=Event.find(params[:id])
  end
  
  def update
  	  @event=Event.find(params[:id])
  	  if request.patch?
  	  	  if @event.update(:headline => params[:event][:headline], :description => params[:event][:description], 
  	  	  		  :time=>params[:event][:time], :image => params[:event][:image])
  	  	  	  flash[:notice]="Event successfully updated"
  	  	  else
  	  	  	  flash[:notice]="Error! Could not update event"
  	  	  end
  	  	  redirect_to action: "index"
  	  end
  end

  def destroy
  	  @event = Event.find(params[:id])
  	  if @event.destroy
  	  	  flash[:notice]="Event successfully deleted"
  	  else
  	  	  flash[:notice]="Error! Could not delete event"
  	  end
  	  redirect_to action: "index"  	  
  end

  def new
  	  @event=Event.new	  	  
  end
  def create
  	  if request.post?
  	  	  @event = Event.new(:headline => params[:event][:headline], :description => params[:event][:description], 
  	  	  		  :time=>params[:event][:time], :image => params[:event][:image])
  	  	  if  @event.save
  	  	  	  flash[:notice]="Event successfully added"
  	  	  else
  	  	  	  flash[:notice]="Error! Could not add event"
  	  	  end
  	  	  redirect_to action: "index"
  	  end
  end
end
