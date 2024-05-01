# frozen_string_literal: true

require 'rails_helper'

describe 'games index page', js: true do
  let!(:games) { create_list(:game, 2) }

  it 'lists existing games' do
    visit games_path

    expect(page).to have_content games.first.name
    expect(page).to have_content games.last.name
  end
end
