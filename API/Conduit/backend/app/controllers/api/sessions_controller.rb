class Api::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    p user
    if user&.authenticate(session_params[:password])
      render json: {status: 'success', user: user, token: encrypt(user) }
    else
      render json: {status: :unprocessable_entity, user:user}
    end
  end

  def destroy
    log_out
    render json: {status: :see_other}
  end

  private

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
