class Dish < ApplicationRecord
  mount_uploader :image, DishImageUploader

  COURSES = %w(first_course main_course drink).freeze

  has_many :orders_dishes
  has_many :orders, through: :orders_dishes

  scope :first_courses, -> { where(course: 'first_course') }
  scope :main_courses, -> { where(course: 'main_course') }
  scope :drinks, -> { where(course: 'drink') }

  before_create :set_default_date

  validates :name, presence: true
  validates :price, presence: true

  def self.courses
    COURSES
  end

  private

  def set_default_date
    self.available_at = Date.today
  end
end
