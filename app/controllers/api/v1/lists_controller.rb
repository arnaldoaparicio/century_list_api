class Api::V1::ListsController < ApplicationController

    def index
        render json: List.all
    end

    def show
        render json: List.find(params[:id])
    end

    def create
        render json: List.create(list_params)
    end

    private

    def list_params
        params.require(:list).permit(:name)
    end
end