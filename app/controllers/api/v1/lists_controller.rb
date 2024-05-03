class Api::V1::ListsController < ApplicationController
  def index
    render json: ListSerializer.new(List.all), status: 200
  end

  def show
    list = List.find_by_id(params[:id])
    render json: ListSerializer.new(list.items), status: 200
  end

  def create
    render json: List.create(list_params)
  end

  def update
    render json: List.update(params[:id], list_params)
  end

  def destroy
    render json: List.delete(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
