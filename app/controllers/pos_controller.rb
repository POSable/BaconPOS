class PosController < ApplicationController

  def index
  end

  def new
    @pos = Pos.new
  end

  def create
    @pos = Pos.new(pos_params)
    if @pos.save
      redirect_to user_path(current_user), notice: 'POS successfully created'
    end
  end

  def update
    @pos = Pos.find(params[:id])
    if @pos.update(pos_params)
      redirect_to user_path(current_user), notice: 'POS successfully updated'
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
