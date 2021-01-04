class AuthenticationService prepend SimpleCommand
    def initialize(email, password)
        @email = email
        @password = password
    end

    def call
        JsonWebToken.encode(user_id: user.id) if user
    end

    private

    attr_accessor :email, :password

    def user
        target_user = User.find_by_email(email)
        return target_user if target_user && target_user.authenticate(password)

        errors.add :user_authentication, "Invalid credentials"
        nil
    end
end