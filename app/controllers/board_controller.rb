class BoardController < ApplicationController
    before_action :authorize_request

    def index
        map = HashWithIndifferentAccess.new
        current_user.boards.each do |elem|
            map[elem.id] = elem.to_json
        end
        render json: {boards: map}, status: 200
    end

    def get
        ensure_params_exists
        board = current_user.boards.find(params[:id])

        render json: {board: board.to_json}, status: 200
    end

    def create
        ensure_params_exists
        Board.create!(board_params)

        render json: {success: "Board created successfully!"}, status: 200
    end

    def edit
        ensure_params_exists
        board = current_user.boards.find(params[:id])
        board.update(board_params)

        render json: {success: "Board updated successfully!"}, status: 200
    end

    def delete
        ensure_params_exists
        board = current_user.boards.find(params[:id])
        board.delete

        render json: {success: "Board deleted successfully!"}, status: 200
    end

    def archive
        ensure_params_exists
        board = current_user.boards.find(params[:id])
        board.archiving_date = DateTime.now
        board.save
        render json: {success: "Board archived successfully"}, status: 200
    end

    def restore

    end

    private

    def board_params
        params.merge(user_id: current_user.id).permit(:name, :is_public, :user_id, :archiving_date)
    end

    def ensure_params_exists
        render json: {error: "Lack of board parameters!"}, status: 400 unless params
    end
end
