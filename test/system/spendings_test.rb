require 'application_system_test_case'

class SpendingsTest < ApplicationSystemTestCase
  setup do
    @spending = spendings(:one)
  end

  test 'visiting the index' do
    visit spendings_url
    assert_selector 'h1', text: 'Spendings'
  end

  test 'should create spending' do
    visit spendings_url
    click_on 'New spending'

    fill_in 'Amount', with: @spending.amount
    fill_in 'Name', with: @spending.name
    fill_in 'User', with: @spending.user_id
    click_on 'Create Spending'

    assert_text 'Spending was successfully created'
    click_on 'Back'
  end

  test 'should update Spending' do
    visit spending_url(@spending)
    click_on 'Edit this spending', match: :first

    fill_in 'Amount', with: @spending.amount
    fill_in 'Name', with: @spending.name
    fill_in 'User', with: @spending.user_id
    click_on 'Update Spending'

    assert_text 'Spending was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Spending' do
    visit spending_url(@spending)
    click_on 'Destroy this spending', match: :first

    assert_text 'Spending was successfully destroyed'
  end
end
