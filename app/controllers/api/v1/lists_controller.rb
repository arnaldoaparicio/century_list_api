class Api::V1::ListsController < ApplicationController

    def index
        render json: List.all
    end
end