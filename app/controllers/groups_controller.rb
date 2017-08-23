class GroupsController < ApplicationController
  before_action :set_group, only: %i[edit update]
  def index
    @groups = current_user.groups
    @user = current_user
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, notice: "グループを編集しました"
    else
      flash.update[:alert] = "グループ名を入力してください"
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  # def user_logged_in?
  #   if session[:user_id]
  #     begin
  #       @current_user = User.find_by(user_id: session[:user_id])
  #     rescue ActiveRecord::RecordNotFound
  #       reset_user_session
  #     end
  #   end
  #   return if @current_user
  #   # @current_userが取得できなかった場合はログイン画面にリダイレクト
  #   flash[:referer] = request.fullpath
  # end
end



