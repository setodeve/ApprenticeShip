require 'jwt'

class ApplicationController < ActionController::API
  def user_confirmation
    token = request.headers['Authorization']
    return User.find(decrypt(token))
  end

  def encrypt(user)
    payload = {id: user.id}
    return JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256'
  end

  def decrypt(token)
    decoded_token = JWT.decode token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' }
    return decoded_token[0]["id"]
  end
  
  def check_current_user
    @current_user = user_confirmation
  end
end

