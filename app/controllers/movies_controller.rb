class MoviesController < ApplicationController
  def index
    @movie = Movie.all
    @movie = @movie.search_title(params[:title]) unless params[:title].blank?
    @movie = @movie.search_director(params[:director]) unless params[:director].blank?
    @movie = @movie.search_time(params[:runtime_in_minutes]) unless params[:runtime_in_minutes].blank?
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster, :description, :remote_poster_url
    )
  end
  
end
