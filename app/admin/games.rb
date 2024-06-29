# frozen_string_literal: true

ActiveAdmin.register Game do
  permit_params :name, :owner

  filter :owner, collection: -> { User.all.map { |u| "#{u.first_name} #{u.last_name}" } }
end
