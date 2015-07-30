class PosController < ApplicationController

  def destroy
    @user = User.find(params[:id])
    @pos = Pos.find(params[:id])
    @pos.destroy
      redirect_to user_path(@user), alert: 'POS Deleted'
  end


end
