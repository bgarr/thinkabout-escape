# frozen_string_literal: true

ActiveAdmin.register Puzzle do
  permit_params :name, :owner_id

  form do |f|
    f.inputs 'Puzzle Definition' do
      f.input :name
      render 'puzzles/logic_editor', { puzzle: @puzzle }
    end
    f.actions
  end
end
