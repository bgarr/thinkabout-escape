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
end
