# frozen_string_literal: true

require 'rails_helper'

describe 'user sessions' do
  let(:user) { create(:user) }

  describe 'account creation' do
    it 'emails a new user for confirmation' do
      visit root_path
      click_on 'Sign in'

      fill_in('user_email', with: user.email)
      fill_in('user_password', with: '123456')
      click_on 'Sign up'

      sent_email = ActionMailer::Base.deliveries.last
      expect(sent_email.from).to include('accounts.plan-my-escape@thinkabout.com')
      expect(sent_email.subject).to eq('Confirmation instructions')
      expect(sent_email.to).to include(user.email)
    end
  end

  describe 'authenticated user' do
    let(:confirmed_user) { create(:user, :confirmed) }

    it 'goes to game index' do
      visit root_path
      click_on 'Sign in'

      fill_in('user_email', with: confirmed_user.email)
      fill_in('user_password', with: confirmed_user.password)
      click_on 'Log in'

      expect(page).to have_current_path(games_path, ignore_query: true)
    end
  end
end
