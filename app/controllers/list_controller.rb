require 'json'

class ListController < ApplicationController

    before_action :authorize_request

    def create
        ensure_params_exist
        List.create!(list_params)

        render json: {success: "List created successfully!"}, status: 201
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
        target_list = List.find(params[:id])
        target_list.update(list_params)

        render json: {success: "List updated successfully"}, status: 200
    end

    def delete
        ensure_params_exist
        target_list = List.find(params[:id])
        target_list.delete

        render json: {success: "Successfully deleted the list"}, status: 200
    end

    private 

    def list_params
        params.permit(:id, :name, :board_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end

end
