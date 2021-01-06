class HistoryEntryController < ApplicationController

    def create
        ensure_params_exist
        HistoryEntry.create!(entry_params)

        render json: {success: "History entry created successfully"}, status: 200
    end

    def get_all
        ensure_params_exist
        render json: Board.find(params[:board_id]).history_entries.order(entry_date: :desc), adapter: :json, each_serializer: HistoryEntrySerializer, status: 200
    end

    private

    def ensure_params_exist
        render json: {error: "Lack of history entry parameters"}, status: 400 unless params
    end

    def entry_params
        params.permit(:user_id, :entry_date, :description, :board_id);
    end
end
