require 'rails_helper'

describe 'Order' do
  before do
    sign_in(is_admin: false)

    # First Courses
    Dish.create!(name: 'Soup', price: 60.0, course: 'first_course')

    # Main Courses
    Dish.create!(name: 'Meat', price: 50.0, course: 'main_course')

    # Drinks
    Dish.create!(name: 'Tea', price: 15.0, course: 'drink')

  end

  scenario 'Managing an Orders' do
    visit orders_path

    click_link "Create new order for #{Date.today}"

    within '#order_form' do
      click_on 'Create Order'
    end

    expect(page).to have_content('Order was successfully created.')

    table = find('table')

    expect(table).to have_content('Soup')
    expect(table).to have_content('60')

    click_on 'Destroy'

    expect(page).to have_content('Order was successfully destroyed.')
    expect(page).to have_no_selector('table')
  end
end
