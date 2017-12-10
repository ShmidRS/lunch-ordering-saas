require 'rails_helper'

RSpec.describe Api::V1::UserOrdersController, type: :controller do
  render_views

  let(:lunch_company) { FactoryGirl.create(:lunch_company) }

  # First Courses
  let(:soup) { Dish.create!(name: 'Soup', price: 60.0, course: 'first_course') }
  let(:borscht) { Dish.create!(name: 'Borscht', price: 70.0, course: 'first_course') }

  # Main Courses
  let(:meat) { Dish.create!(name: 'Meat', price: 50.0, course: 'main_course') }
  let(:potato) { Dish.create!(name: 'Potato', price: 40.0, course: 'main_course') }

  # Drinks
  let(:coffee) { Dish.create!(name: 'Coffee', price: 10.0, course: 'drink') }
  let(:tea) { Dish.create!(name: 'Tea', price: 15.0, course: 'drink') }

  # Users
  let(:homer) do
    FactoryGirl.create(
        :user,
        first_name: 'Homer',
        last_name: 'Simpson',
        email: 'homer@simpson.com'
    )
  end

  let(:ned) do
    FactoryGirl.create(
        :user,
        first_name: 'Ned',
        last_name: 'Flanders',
        email: 'ned@flanders.com'
    )
  end

  # Creating Orders
  before do
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
  end

  describe 'GET #index' do
    it 'return orders for today' do
      request.headers[:token] = lunch_company.token
      process :index, method: :get

      expected_response = [
        { 'first_name'=>'Homer', 'last_name'=>'Simpson', 'email'=>'homer@simpson.com',
          'orders'=> [
            {
              'dishes'=> [
                { 'name'=>'Soup', 'price'=>'60.0', 'course'=>'first_course', 'image'=>nil },
                { 'name'=>'Meat', 'price'=>'50.0', 'course'=>'main_course', 'image'=>nil },
                { 'name'=>'Coffee', 'price'=>'10.0', 'course'=>'drink', 'image'=>nil }
              ]
            },
            { 'dishes'=> [
                { 'name'=>'Meat', 'price'=>'50.0', 'course'=>'main_course', 'image'=>nil },
                { 'name'=>'Borscht', 'price'=>'70.0', 'course'=>'first_course', 'image'=>nil },
                { 'name'=>'Tea', 'price'=>'15.0', 'course'=>'drink', 'image'=>nil }
              ]
            }
          ]
        },
        { 'first_name'=>'Ned', 'last_name'=>'Flanders', 'email'=>'ned@flanders.com',
          'orders'=> [
            { 'dishes'=> [
              { 'name'=>'Soup', 'price'=>'60.0', 'course'=>'first_course', 'image'=>nil },
              { 'name'=>'Tea', 'price'=>'15.0', 'course'=>'drink', 'image'=>nil },
              { 'name'=>'Potato', 'price'=>'40.0', 'course'=>'main_course', 'image'=>nil }
              ]
            }
          ]
        }
      ]

      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end