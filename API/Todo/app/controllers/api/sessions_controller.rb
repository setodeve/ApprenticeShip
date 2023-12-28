class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: decrypt(params["token"]))
    if user&.authenticate(params[:password])
      reset_session
      log_in user
      render json: {status: 'success', data: {user: user, token: encrypt(user)} }
    else
      render json: {status: :unprocessable_entity}
    end
  end

  def destroy
    log_out
    render json: {status: :see_other}
  end
end
