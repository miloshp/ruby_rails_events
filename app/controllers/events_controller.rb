class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :update, :show, :destroy]

  def new
    @event = Event.new
  end

  def index
    @event = Event.all
    if @event.length.zero?
      flash[:alert] = 'You have no appointments. Create one now to get started.'
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user = User.find_by(id: session[:user_id])
    if @event.save
      ExampleMailer.sample_email(@event.user).deliver
      flash[:success] = "Event created!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end


  def update
    if @event.update(event_params)
      flash[:success] = "Updated!"
      redirect_to event_path(@event)
    else
      flash[:success] = "Not updated."
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Deleted!"
    redirect_to event_path
  end

  def sort_name
    @sort = Event.order('LOWER(title) ASC')
  end

  def sort_due
    @sortdue = Event.order('when_date ASC')
  end

  def sort_created
    @sortcreat = Event.order('created_at DESC')
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :when_date, :latitude, :longitude)
  end


  def set_event
    @event = Event.find(params[:id])
  end

end