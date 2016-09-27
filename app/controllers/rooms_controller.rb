class RoomsController < ApplicationController

  def index
    @rooms = Room.search(params[:search])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)
    @room.location= params[:location]
    @room.size = params[:size]
    if @room.save
      name = @room.name
      redirect_to rooms_path
      flash[:notice] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create room. Please try again"
    end
  end

  def destroy
    @room = Room.find(params[:id])
<<<<<<< HEAD
    @booking_of_room = Booking.find(@booking.room)     ## 09-26
    @booking_of_room.destroy                          ## 09-26
=======

    @bookings=Booking.all
        @bookings.each do |booking|
        if booking.room_id == @room.id
            booking.destroy
        end
    end

>>>>>>> 6d74c0f8aab1872774b6b4619e7c3759fe8a54bf
    @room.destroy
    redirect_to rooms_path
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update room_params
    if @room.save
      flash[:notice] = "Your room was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def room_params
      params.require(:room).permit(:name,:location, :size, :delete)
    end

end
