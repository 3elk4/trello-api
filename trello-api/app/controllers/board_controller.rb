class BoardController < ApplicationController
    before_action :authenticate_request

    def index
        tables = current_user.tables
        map = HashWithIndifferentAccess.new
        tables.each do |elem|
            map[elem.id] = {elem.name}
        end
        render json: {tables: map}, status: 200
    end

    def show
        table = current_user.tables.find(params[:id]) # todo: what if params == null?
        render json: {table: JSON.parse(table)}, status: 200
    end

    def create
        table = Table.create!(name)
    end

    def update
    end

    def delete
    end
end
