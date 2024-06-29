# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  actions :all, except: %i[new destroy]

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
end
