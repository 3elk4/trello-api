class JsonWebToken
    class << self
        def encode(payload, expire_time = 24.hours.from_now)
            payload[:expire_time] = expire_time.to_i
            return JWT.encode(payload, Rails.application.secret_key_base)
        end

        def decode(token)
            body = JWT.decode(token, Rails.application.secret_key_base)[0]
            HashWithIndifferentAccess.new body
        end
    end
end