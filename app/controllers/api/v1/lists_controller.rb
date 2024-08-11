class Api::V1::ListsController < ApplicationController
  def index
    render json: ListSerializer.new(List.all), status: 200
  end

  def show
    list = List.find_by_id(params[:id])
    render json: ListSerializer.new(list), status: 200
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: ListSerializer.new(list), status: 201
    else
      render status: 400
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: ListSerializer.new(list)
    else
      render status: 422
    end
  end

  def destroy
    render json: List.delete(params[:id])
  end

  def list_collection
    list = List.find_by_id(params[:id])
    render json: ItemSerializer.new(list.items), status: 200
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
