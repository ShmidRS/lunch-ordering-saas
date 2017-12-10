# First Courses
soup = Dish.create!(name: 'Soup', price: 60.0, course: 'first_course')
borscht = Dish.create!(name: 'Borscht', price: 70.0, course: 'first_course')

# Main Courses
meat = Dish.create!(name: 'Meat', price: 50.0, course: 'main_course')
potato = Dish.create!(name: 'Potato', price: 40.0, course: 'main_course')

# Drinks
coffee = Dish.create!(name: 'Coffee', price: 10.0, course: 'drink')
tea = Dish.create!(name: 'Tea', price: 15.0, course: 'drink')

# Users
homer = User.create!(
  first_name: 'Homer',
  last_name: 'Simpson',
  email: 'homer@simpson.com',
  password: '123456'
)

ned = User.create!(
  first_name: 'Ned',
  last_name: 'Flanders',
  email: 'ned@flanders.com',
  password: '123456'
)

# Creating Orders
homers_order = homer.orders.build
homers_order.add_dish(id: soup.id, course: 'first_course')
homers_order.add_dish(id: meat.id, course: 'main_course')
homers_order.add_dish(id: coffee.id, course: 'drink')
homers_order.save

second_homers_order = homer.orders.build
second_homers_order.add_dish(id: borscht.id, course: 'first_course')
second_homers_order.add_dish(id: meat.id, course: 'main_course')
second_homers_order.add_dish(id: tea.id, course: 'drink')
second_homers_order.save

neds_order = ned.orders.build
neds_order.add_dish(id: soup.id, course: 'first_course')
neds_order.add_dish(id: potato.id, course: 'main_course')
neds_order.add_dish(id: tea.id, course: 'drink')
neds_order.save

# Creating Default LunchCompany
LunchCompany.create(
  name: 'Lunches Delivery Company',
  token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb21wYW55X25hbWUiOiJMdW5jaGVzIERlbGl2ZXJ5IENvbXBhbnkifQ.lW8zRwhqgphxlZg9aZvtaN9NjF0oYVnItjSTBlWtMVw'
)
