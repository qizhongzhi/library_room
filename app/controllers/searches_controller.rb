class SearchesController < ApplicationController
  def new
    @search = Search.new
    @location = Room.uniq.pluck(:location)
    @size = Room.uniq.pluck(:size)
    @status = Room.uniq.pluck(:status)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:name, :location, :size, :status)
  end
end