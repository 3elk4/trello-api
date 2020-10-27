class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
        @current_user = AuthorizeRequest.call(request.headers).result
        session[:user_id] = @current_user.id if @current_user
        render json: {error: "Not authorized, go away you poor peasant"}, status: 401 unless @current_user
    end
end
