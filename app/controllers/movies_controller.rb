class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end
  def new
    @movie = Movie.new # Needed to instantiate the simple_form
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save

    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    # No need for app/views/movies/update.html.erb
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    # No need for app/views/movies/destroy.html.erb
    redirect_to movies_path, status: :see_other
  end
  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating)
  end
end
