class FakeController < ApplicationController

  def api_landing
    check_it = request.body.ready
  end

end
