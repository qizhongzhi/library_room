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
