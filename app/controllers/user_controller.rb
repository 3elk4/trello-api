class UserController < ApplicationController

    skip_before_action :authorize_request, only: [:create]

    def create
        ensure_params_exist
        User.create!(user_params)

        render json: {success: "User created successfully!"}, status: 200
    end

    def update
        ensure_params_exist
        target_user = User.find(params[:id])
        target_user.update(user_params)
        target_user.attach(params[:avatar])

        render json: {success: "updated user successfully"}, status: 200
    end

    def get
        ensure_params_exist 
        target_user = User.find(params[:id])

        render json: {username: target_user[:username], avatar_url: target_user.get_avatar_url}, status: 200
    end

    def delete 
        ensure_params_exist
        target_user = User.find(params[:id])
        if target_user.avatar.attached? then
            target_user.avatar.purge
        end
        target_user.delete

        render json: {success: "deleted user successfully"}, status: 200
    end


    private

    def user_params
        params.permit(:username, :password, :avatar)
    end

    def ensure_params_exist
        render json: {error: "Lack of user parameters!"}, status: 400 unless params
    end
end
