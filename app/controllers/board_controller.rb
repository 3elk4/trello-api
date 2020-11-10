class BoardController < ApplicationController
    before_action :authorize_request

    def index
        map = HashWithIndifferentAccess.new
        current_user.boards.order(:archiving_date, :asc).each do |elem|
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

        render json: {success: "Board created successfully!"}, status: 201
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
        unless board.archiving_date.nil? then
            board.delete
            render json: {success: "Board deleted successfully!"}, status: 200
        else
            render json: {error: "Cannot delete unarchived board!"}, status: 403
        end
    end

    def archive
        update_archived_board(DateTime.now)
    end

    def restore
        update_archived_board(nil)
    end

    private

    def update_archived_board(newdate)
        ensure_params_exists
        board = current_user.boards.find(params[:id])
        board.archiving_date = newdate
        board.save
        render json: {success: "Operation completed successfully"}, status: 200
    end

    def board_params
        params.merge(user_id: current_user.id).permit(:name, :is_public, :user_id, :archiving_date)
    end

    def ensure_params_exists
        render json: {error: "Lack of board parameters!"}, status: 400 unless params
    end
end
