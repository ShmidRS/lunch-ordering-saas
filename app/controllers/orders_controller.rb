class OrdersController < ApplicationController
  before_action :find_order, only: %i[show edit update destroy]
  before_action :find_all_dishes, only: %i[new index show]

  def index
    @order = Order.new
    @orders = Order.where(
      user: current_user,
      ordered_at: params[:date].present? ? params[:date] : Date.today
    ).reverse
  end

  def show; end

  def create
    @order = current_user.orders.build
    @order.add_dish(id: order_params[:first_course_id], course: 'first_course')
    @order.add_dish(id: order_params[:main_course_id], course: 'main_course')
    @order.add_dish(id: order_params[:drink_id], course: 'drink')

    if @order.save
      redirect_to orders_url,
                  notice: I18n.t('model_was_successfully_created',
                                 model_name: @order.model_name.human)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @order.update(dish_params)
      redirect_to orders_url,
                  notice: I18n.t('model_was_successfully_updated',
                                 model_name: @order.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url,
                notice: I18n.t('model_was_successfully_destroyed',
                               model_name: @order.model_name.human)
  end

  private

  def find_order
    @order = current_user.orders.find_by(
      id: params[:id],
      ordered_at: Date.today
    )
  end

  def find_all_dishes
    @dishes = Dish.where(
      available_at: params[:date].present? ? params[:date] : Date.today
    )
  end

  def order_params
    params.require(:order).permit(:first_course_id, :main_course_id, :drink_id)
  end
end
