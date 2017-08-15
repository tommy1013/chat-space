class UsersController < ApplicationController

  def edit
  end

  def update
    user.update(user_params)
    if user.id == current_user.id
    redirect_to root_path
     else
      flash.now[:alert] = "グループ名を入力してください"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_group
   @user = User.find(params[:id])
  end
end


