# frozen_string_literal: true

module AuthenticableUser
  protected

  def current_user
    User.find_by(id: payload['sub']) if valid_to_authentication?
  end

  def valid_to_authentication?
    token && payload
  end

  def token
    @token ||= request.headers['auth'].to_s.match(/Bearer (.*)/).to_a.last
  end

  def payload
    @payload ||= JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256').first
  rescue JWT::DecodeError
    {}
  end
end
