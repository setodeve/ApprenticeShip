class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: { status: 'success', data: @user }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      render json: {status: 'success', data: {user: @user} }
    else
      render json: {status: :unprocessable_entity, data: @user }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
