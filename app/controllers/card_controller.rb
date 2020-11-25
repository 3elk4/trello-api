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

    def get_all
        ensure_params_exist
        cards = get_all_cards
        
        cards_json = []
        cards.each do |c|
            cards_json.append(c.to_json)
        end

        render json: {cards: cards_json}, status: 200
    end

    def edit
        ensure_params_exist
        target_card = get_cards.find(params[:id])
        target_card.update(card_params)

        render json: {success: "Card updated successfully"}, status: 200
    end

    def delete
        ensure_params_exist
        target_card = get_cards.find(params[:id])
        target_card.delete

        render json: {success: "Successfully deleted the card"}, status: 200
    end

    def archive
        update_archived_card(DateTime.now)
    end

    def restore
        update_archived_card(nil)
    end

    private 

    def update_archived_card(new_date)
        ensure_params_exist
        target_card = get_cards.find(params[:id])
        target_card.archiving_date = new_date
        target_card.save

        render json: {success: "Operation completed successfully"}, status: 200
    end

    def get_cards
        current_user.boards.find(params[:board_id]).lists.find(params[:list_id]).cards
    end

    def get_all_cards
        cards = current_user.boards.find(params[:board_id]).lists.flat_map { |e| e.cards }
    end

    def card_params
        params.permit(:name, :description, :list_id)
    end

    def ensure_params_exist
        render json: {error: "Lack of list parameters!"}, status: 400 unless params
    end
end