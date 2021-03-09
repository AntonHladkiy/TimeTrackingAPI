# frozen_string_literal: true

class JsonWebToken
  def self.encode(payload)
    expiration = 2.weeks.from_now.to_i
    JWT.encode payload.merge(exp: expiration), ENV['secretkey']
  end

  def self.decode(token)
    JWT.decode(token, ENV['secretkey']).first
  end
end
