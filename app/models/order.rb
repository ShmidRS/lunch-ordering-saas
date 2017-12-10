class Order < ApplicationRecord
  has_many :orders_dishes
  has_many :dishes, through: :orders_dishes
  belongs_to :user

  before_create :set_default_date

  def add_dish(id:, course:)
    self.dishes << Dish.find_by(id: id, course: course)
  end

  private

  def set_default_date
    self.ordered_at = Date.today
  end
end
