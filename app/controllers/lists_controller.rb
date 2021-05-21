class ListsController < ApplicationController
  def index
    @movies = Movie.all
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = @list.movies
  end

  def new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path(@list)
    else
      redirect_to root_path, notice: @list.errors.full_messages.join
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
