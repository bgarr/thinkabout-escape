# frozen_string_literal: true

ActiveAdmin.register GamePlay do
  permit_params :name, :owner_id

  filter :player, collection: User.all_names
end
