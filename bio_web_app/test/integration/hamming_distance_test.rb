require 'test_helper'

class HammingDistanceTest < ActionDispatch::IntegrationTest
  test 'happy path' do
    visit '/'
    click_link('Calculate Hamming Distance')

    fill_in('First DNA strand', with: 'ACG')
    fill_in('Second DNA strand', with: 'ACT')

    click_button('Calculate')

    assert page.has_text?('Result: 1')
  end

  test "unhappy path - wrong input" do
    visit '/'
    click_link('Calculate Hamming Distance')

    fill_in('First DNA strand', with: 'ACG')
    fill_in('Second DNA strand', with: 'ACTG')

    click_button('Calculate')

    assert page.has_text?('Incorrect input')
  end
end
