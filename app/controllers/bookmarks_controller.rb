class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
    redirect_to list_path(@list)
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), notice: @bookmark.errors.full_messages.join
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_bookmarks_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
