class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email, :password)

    session[:user_id] = User.create(user_params).id

    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end
end
