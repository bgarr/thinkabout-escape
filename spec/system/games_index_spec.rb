# frozen_string_literal: true

require 'rails_helper'

describe 'games#index', :js do
  let(:confirmed_user) { create(:user, :confirmed) }
  let!(:my_games) { create_list(:game, 2, owner: confirmed_user) }
  let!(:other_games) { create_list(:game, 2) }

  describe 'when authenticated user' do
    it "lists only user's games" do
      visit root_path
      click_on 'Sign in'

      fill_in('user_email', with: confirmed_user.email)
      fill_in('user_password', with: confirmed_user.password)
      click_on 'Log in'

      expect(page).to have_content my_games.first.name
      expect(page).to have_content my_games.last.name
      expect(page).to have_no_content other_games.first.name
      expect(page).to have_no_content other_games.last.name
    end
  end
end
