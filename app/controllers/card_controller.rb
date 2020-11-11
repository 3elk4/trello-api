require 'json'

class CardController < ApplicationController
    before_action :authorize_request

    def create
        ensure_params_exist
        Card.create!(card_params)

        render json: {success: "Card created successfully!"}, status: 201
    end

    def get
        ensure_params_exist
        cards = get_cards
        
        cards_json = []
        cards.each do |c|
            cards_json.append(c.to_json)
        end
        
        render json: {cards: cards_json}, status: 200
    end

    def edit
        ensure_params_exist
        target_card = get_cards.find(params[:card_id])
        target_card.update(card_params)

        render json: {success: "Card updated successfully"}, status: 200
    end

    def delete
        ensure_params_exist
        target_card = get_cards.find(params[:card_id])
        target_card.delete

        render json: {success: "Successfully deleted the card"}, status: 200
    end

    private 

    def get_cards
        current_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards
    end

    def card_params
        params.permit(:name, :list_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end
end