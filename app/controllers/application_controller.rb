class ApplicationController < ActionController::API
    before_action :authorize_request
    attr_reader :current_user

    private

    def authorize_request
        @current_user = AuthorizeRequest.call(request.headers).result
        session[@current_user.id] = request.headers["Authorization"].split(' ').last if @current_user
        render json: {error: "Not authorized, go away you poor peasant"}, status: 401 unless @current_user
    end
end
