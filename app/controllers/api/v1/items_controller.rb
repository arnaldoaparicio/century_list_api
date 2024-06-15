class Api::V1::ItemsController < ApplicationController

  def show
    item = Item.find_by(id: params[:item_id])
    render json: ItemSerializer.new(item), status: 200
  end
end