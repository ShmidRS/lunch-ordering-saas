class Api::V1::UserOrdersController < ActionController::API
  before_action :check_lunch_company

  def index
    @orders = Order.where(ordered_at: Date.today)

    render 'api/v1/user_orders/index.json.jbuilder', status: 200
  end

  private

  def check_lunch_company
    render json: {}, status: 403 unless LunchCompany.find_by(token: request.headers[:token])
  end
end
