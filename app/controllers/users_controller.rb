class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to "/sessions/new", notice: "Cadastro realizado com sucesso!"
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end