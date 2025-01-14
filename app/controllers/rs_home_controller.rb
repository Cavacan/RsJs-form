class RsHomeController < ApplicationController
  def index
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :index,  status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end
end
