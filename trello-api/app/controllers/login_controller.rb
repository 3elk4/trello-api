class LoginController < ApplicationController

  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticationService.call(params[:username], params[:password])
    if command.success?
      render json: { token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
