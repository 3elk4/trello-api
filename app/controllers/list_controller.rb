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
        render json: {lists: get_board_lists.order(:position).map {|l| l.to_json}}, status: 200
    end

    def get_list_name
        ensure_params_exist
        render json: {name: get_board_lists.find(params[:id]).name}, status: 200
    end

    def edit
        ensure_params_exist
        target_list = get_board_lists.find(params[:id])
        target_list.update(list_params)

        render json: {success: "List updated successfully"}, status: 200
    end

    def move
        ensure_params_exist
        target_list = get_board_lists.find(params[:id])
        target_list[:board_id] = params[:new_board_id]
        target_list.save

        render json: {success: "List moved successfully"}, status: 200
    end

    def reorder
        request_json = params.to_h
        List.transaction do
            request_json.each do |list_id, new_position|
                target = List.find(list_id)
                target.position = new_position
                target.save!
            end
        end

        render json: {success: "lists reordered successfully!"}, status: 200
    end

    def archive
        update_archived_list(DateTime.now)
    end

    def restore
        update_archived_list(nil)
    end

    def delete
        ensure_params_exist
        target_list = get_board_lists.find(params[:id])
        unless target_list.archiving_date.nil? then
            target_list.delete
            render json: {success: "List deleted successfully!"}, status: 200
        else
            render json: {success: "Cannot delete unarchived list!"}, status: 403
        end
    end

    private 

    def update_archived_list(new_date)
        ensure_params_exist
        target_list = get_board_lists.find(params[:id])
        target_list.archiving_date = new_date
        target_list.save

        render json: {success: "Operation completed successfully"}, status: 200
    end

    def get_board_lists
        current_user.boards.find(params[:board_id]).lists
    end

    def list_params
        params.permit(:name, :board_id, :position)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end

end
