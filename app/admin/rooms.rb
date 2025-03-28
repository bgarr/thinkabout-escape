# frozen_string_literal: true

ActiveAdmin.register Room do
  permit_params :name, :owner_id, :model_file

  filter :owner, collection: User.all_names

  form do |f|
    f.inputs 'Room Definition' do
      f.input :name
      f.input :owner, as: :select, collection: User.all_names
      f.input :model_file, as: :file

      render 'rooms/path_plotter', { game: @game }
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :owner
      row :model_file do |room|
        if room.model_file.attached?
          link_to room.model_file.filename,
                  rails_blob_path(room.model_file, disposition: 'attachment')
        end
      end
    end
  end
end
