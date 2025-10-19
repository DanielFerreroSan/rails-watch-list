class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
  @list = List.new(name: list_params[:name])

  if @list.save
    Array(list_params[:movie_ids]).reject(&:blank?).each do |movie_id|
      @list.bookmarks.create(movie_id: movie_id, comment: "Agregada al crear lista")
    end
    redirect_to lists_path
  else
    render :new
  end
end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: "List was successfully deleted."
  end

  private

  def list_params
    params.require(:list).permit(:name, movie_ids: [])
  end
end
