require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  background { visit new_user_session_path }
  scenario 'render email field' do
    expect(page).to have_field('user[email]')
  end

  scenario 'render password field' do
    expect(page).to have_field('user[password]')
  end

  context 'submit form' do
    scenario 'submission without details' do
      click_button 'Log in'
      expect(page).to have_current_path('/users/sign_in')
    end

    scenario 'correct details for log in' do
      @user = User.create(name: 'Affa', email: 'aa@gmail.com', password: '123456')
      within 'form' do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      expect(page).to have_current_path('/')
    end
  end
end
