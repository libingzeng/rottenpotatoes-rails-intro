class MoviesController < ApplicationController

  def movie_params
    puts "controller......................movie_params....................."
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    puts "controller......................show....................."
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
    puts "controller......................index....................."
  end

  def new
    puts "controller......................new....................."
    # default: render 'new' template
  end

  def create
    puts "controller......................create....................."
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    puts "controller......................edit....................."
    @movie = Movie.find params[:id]
  end

  def update
    puts "controller......................update....................."
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    puts "controller......................destroy....................."
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
