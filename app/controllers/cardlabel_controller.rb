require 'json'

class CardlabelController < ApplicationController
    before_action :authorize_request

    def assign_label
        ensure_params_exist
        CardsLabel.create!(card_label_params)

        render json: {success: "Label assigned successfully!"}, status: 201
    end

    def unassign_label
        ensure_params_exist
        card_label = CardsLabel.where(card_id: params[:card_id], label_id: params[:label_id]).first
        card_label.delete

        render json: {success: "Label unassigned successfully!"}, status: 200
    end

    private

    def card_label_params
        params.permit(:card_id, :label_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end
end