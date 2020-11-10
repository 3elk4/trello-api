require 'json'

class ListController < ApplicationController

    before_action :authorize_request

    def create
        ensure_params_exist
        List.create!(list_params)

        render json: {success: "List created successfully!"}, status: 200
    end

    def get
        ensure_params_exist
        board_id = params[:board_id]
        lists = List.where(board_id: board_id)
        
        list_jsons = []
        lists.each do |l|
            list_jsons.append(l.to_json)
        end
        
        render json: {lists: list_jsons}, status: 200
    end

    def edit
        ensure_params_exist
    end

    def delete
        ensure_params_exist
    end

    private 

    def list_params
        params.permit(:name, :board_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end

end
