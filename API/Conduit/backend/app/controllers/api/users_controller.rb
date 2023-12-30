class Api::UsersController < ApplicationController
  def show
    @user = user_confirmation()
    render json: { status: 'success', user: @user, token: encrypt(@user) }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {status: 'success', user: @user, token: encrypt(@user) }
    else
      render json: {status: :unprocessable_entity, user: @user }
    end
  end

  def edit
  end

  def update
    @user = user_confirmation()
    if @user.update(user_params)
      render json: {status: 'success', user: @user, token: encrypt(@user) }
    else
      render json: {status: :unprocessable_entity, user: @user }
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
