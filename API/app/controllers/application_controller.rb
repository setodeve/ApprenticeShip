require 'jwt'

class ApplicationController < ActionController::API
  # include SessionsHelper
  
  def user_confirmation
    token = request.headers['Authorization'].nil? ? nil : request.headers['Authorization'].split(' ').last
    user = token.nil? ? nil : User.find_by(id: decrypt(token))
    if !user
      render json: {status: :unauthorized, status: 401}
    end
  end

  def encrypt(user)
    payload = {id: user.id}
    return JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256'
  end

  def decrypt(token)
    decoded_token = JWT.decode token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' }
    return decoded_token[0]["id"]
  end
end
