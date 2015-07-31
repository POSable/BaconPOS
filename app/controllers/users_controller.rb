class UsersController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
  end

  def show
    @pos = Pos.new
    @all_pos = Pos.all
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'Account Successfully Updated'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

end
