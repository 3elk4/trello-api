class CardCommentController < ApplicationController

    def create
        ensure_params_exist
        user = JsonWebToken.decode(request.headers["Authorization"].split(" ").last)
        CardComment.create!(comment_params.merge(user_id: user[:user_id]))

        render json: {success: "Comment created successfully"}, status: 200
    end

    def get_all
        ensure_params_exist
        render json: get_target_card.card_comments, adapter: :json, each_serializer: CardCommentSerializer, status: 200
    end

    def get
        ensure_params_exist
        render json: get_target_card.card_comments.find(params[:id]), adapter: :json, serializer: CardCommentSerializer, status: 200
    end

    def update
        ensure_params_exist
        get_target_card.card_comments.find(params[:id]).update(comment_params)

        render json: {success: "Comment updated successfully"}, status: 200
    end

    def delete
        ensure_params_exist
        get_target_card.card_comments.find(params[:id]).delete

        render json: {success: "comment deleted successfully, sarge!"}
    end

    private

    def get_target_card
        current_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards.find(params[:card_id])
    end

    def comment_params
        params.permit(:content, :card_id, :user_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of comment parameters!"}, status: 400 unless params
    end

end
