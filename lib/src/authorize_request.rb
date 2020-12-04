class AuthorizeRequest prepend SimpleCommand

    def initialize(headers = {})
        @headers = headers
    end

    def call
        user
    end

    private 

    attr_reader :headers

    def user
        @user ||= User.find(decoded_token[:user_id]) if decoded_token
        @user || errors.add(:token, "Invalid token") && nil
    end

    def decoded_token
        passed_token = http_auth_reader
        blacklisted = BlacklistedToken.find_by_token(passed_token)
        if blacklisted.nil? then
            @decoded_token ||= JsonWebToken.decode(passed_token)
        else
            errors.add(:nonauthorized, "ur not logged in, go away u poor peasant")
        end
    end

    def http_auth_reader
        if headers["Authorization"].present?
            return headers["Authorization"].split(' ').last
        else
            errors.add(:token, "Missing token")
        end
    end
end