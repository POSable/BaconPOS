class UsersController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
  end

  def dashboard
  end

end
