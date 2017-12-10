class DashboardsController < ApplicationController
  def index
    @date_range = ((Date.today - 2.weeks)..Date.today)
  end
end
