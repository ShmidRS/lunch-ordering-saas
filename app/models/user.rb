class User < ApplicationRecord
  before_create :first_user_is_admin

  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def first_user_is_admin
    return unless Rails.configuration.first_user_is_admin
    self.admin = true if User.count.zero?
  end
end
