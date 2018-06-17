# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User signs Up', type: :system do
  # before(:all) do
  #   # Ensure no emails are left from previous tests
  #   clear_emails
  # end

  # Build stubbed user
  let(:user) { FactoryBot.build_stubbed(:user) }

  scenario 'open confirmation email' do
    # Open home page
    visit root_path

    # Clink link to go to sign up page
    click_link 'Sign up'

    # Complete sign up form
    fill_in 'user[email]', with: user.email
    fill_in 'user[user_name]', with: user.user_name
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password

    # Submit sign up form
    click_button 'Sign up'

    # Open email address confirmation email
    open_email(user.email)

    # Test that the welcome message is found in the email
    expect(current_email).to have_content "Welcome #{user.email}!"

    # Click link to confirm email address
    current_email.click_link 'Confirm my account'

    # Test that the email address is confirmed and correct success message is present
    expect(page).to have_content 'Your email address has been successfully confirmed.'
  end
end
