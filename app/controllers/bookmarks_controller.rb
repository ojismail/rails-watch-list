class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:movie_id])
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @movie, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end
end
