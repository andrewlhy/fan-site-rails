class MoviesController < ApplicationController
  def index
    if params[:sort_by] == "rating"
      @movies = Movie.all.sort_by{|object| [object.rating]}.reverse
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    render :show
  end

  def new
    @movie = Movie.new
    render :new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    render :edit
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  private
  def movie_params
    params.require(:movie).permit(:name, :rating, :year, :genre, :length)
  end

end
