class Admin::DishesController < Admin::BaseController
  before_action :find_dish, only: %i[show edit update destroy]
  before_action :find_all_dishes, only: %i[edit index show]

  def index; end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to admin_dishes_url,
                  notice: I18n.t('model_was_successfully_created',
                                 model_name: @dish.course.humanize)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @dish.update(dish_params)
      redirect_to admin_dishes_url,
                  notice: I18n.t('model_was_successfully_updated',
                                 model_name: @dish.course.humanize)
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to admin_dishes_url,
                notice: I18n.t('model_was_successfully_destroyed',
                               model_name: @dish.course.humanize)
  end

  private

  def find_dish
    @dish = Dish.find(params[:id])
  end

  def find_all_dishes
    @dishes = Dish.where(available_at: Date.today)
  end

  def dish_params
    params.require(:dish).permit(:name, :price, :course, :image)
  end
end
