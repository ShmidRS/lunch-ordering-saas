uniq_users = @orders.map(&:user).uniq

json.array!(uniq_users) do |user|
  json.first_name user.first_name
  json.last_name user.last_name
  json.email user.email

  json.orders @orders.where(user: user) do |order|
    json.dishes order.dishes.each do |dish|
      json.name dish.name
      json.price dish.price
      json.course dish.course
      json.image dish.image.url
    end
  end
end
