require 'rails_helper'

describe 'Dishes managing by admin' do
  before { sign_in(is_admin: true) }

  scenario 'Managing a dish' do
    visit admin_dishes_path

    click_link 'Create new dish'

    within '#dish_form' do
      fill_in 'dish[name]', with: 'My dish'
      fill_in 'dish[price]', with: 100
      select 'Drink', from: 'dish[course]'
      click_on 'Create Dish'
    end

    expect(page).to have_content('Drink was successfully created')

    new_dish = find('#drinks tbody tr')

    expect(new_dish).to have_content('My dish')
    expect(new_dish).to have_content('100.0')

    within new_dish do
      click_link 'Edit'
    end

    within '#dish_form' do
      fill_in 'dish[name]', with: 'My edited dish'
      fill_in 'dish[price]', with: 200
      select 'Main course', from: 'dish[course]'
      click_on 'Update Dish'
    end

    expect(page).to have_content('Main course was successfully updated')
    expect(find('#drinks')).to have_no_selector('tbody')

    edited_dish = find('#main_courses tbody tr')

    expect(edited_dish).to have_content('My edited dish')
    expect(edited_dish).to have_content('200.0')


    within edited_dish do
      click_link 'Destroy'
    end

    expect(page).to have_content('There is no dishes')
    expect(page).to have_no_selector('#main_courses')
  end
end