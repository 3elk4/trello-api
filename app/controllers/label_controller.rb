require 'json'

class LabelController < ApplicationController
    before_action :authorize_request

    def get_all
        render json: {labels: Label.all.map {|l| l.to_json}}, status: 200
    end
end