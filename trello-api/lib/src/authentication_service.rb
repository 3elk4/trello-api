class AuthenticationService prepend SimpleCommand
    def initialize(username, password)
        @username = username
        @password = password
    end

    def call
        JsonWebToken.encode(user_id: user.id) if user
    end

    private

    attr_accessor :username, :password

    def user
        target_user = User.find_by_username(username)
        return target_user if target_user && target_user.authenticate(password)

        errors.add :user_authentication, "Invalid credentials"
        nil
    end
end