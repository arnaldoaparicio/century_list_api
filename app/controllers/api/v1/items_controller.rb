class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.all), status: 200
  end

  def show
    item = Item.find_by(id: params[:item_id])
    render json: ItemSerializer.new(item), status: 200
  end
end