class BoardController < ApplicationController
    before_action :authenticate_request

    def index
        tables = current_user.tables
        map = HashWithIndifferentAccess.new
        tables.each do |elem|
            map[elem.id] = elem.to_json
        end
        render json: {tables: map}, status: 200
    end

    def show
        ensure_params_exists
        table = current_user.tables.find(params[:id])

        render json: {table: table.to_json}, status: 200
    end

    def create
        ensure_params_exists
        Table.create!(board_params)

        render json: {success: "Board created successfully!"}, status: 200
    end

    def edit
        ensure_params_exists
        table = current_user.tables.find(params[:id])
        table.update(board_params)

        render json: {success: "Board updated successfully!"}, status: 200
    end

    def delete
        ensure_params_exists
        table = current_user.tables.find(params[:id])
        table.delete

        render json: {success: "Board deleted successfully!"}, status: 200
    end

    private

    def board_params
        params.permit(:name, :is_public, :user_id)
    end

    def ensure_params_exists
        render json: {error: "Luck of board parameters!"}, status: 400 unless params
    end
end
