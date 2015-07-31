class PosController < ApplicationController

  def index
  end

  def new
    @pos = Pos.new
  end

  def create
    @user = User.find(params[:id])
    @pos = Pos.new(pos_params)
    if @pos.save
      redirect_to user_path(@user), notice: 'POS successfully created'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @pos = Pos.find(params[:id])
    @pos.destroy
      redirect_to user_path(@user), alert: 'POS Deleted'
  end

  private

  def pos_params
    params.require(:pos).permit(:name, :description)
  end


end
