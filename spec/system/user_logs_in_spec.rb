# frozen_string_literal: true

RSpec.describe 'User logs in' do
  include_context 'user'

  let!(:valid_user_name) { user.user_name }
  let!(:valid_password) { user.password }

  let!(:invalid_user_name) { 'tester1' }
  let!(:invalid_password) { '11111111' }

  scenario 'with valid user_name and password' do
    login_with(valid_user_name, valid_password)
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with invalid user_name' do
    login_with(invalid_user_name, valid_password)
    expect(page).to have_content('Invalid Login or password.')
  end

  scenario 'with invalid password' do
    login_with(valid_user_name, invalid_password)
    expect(page).to have_content('Invalid Login or password.')
  end

  def login_with(user, pass)
    visit new_user_session_path
    fill_in 'user_login', with: user
    fill_in 'user_password', with: pass

    click_button 'Log in'
  end
end
