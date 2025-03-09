# frozen_string_literal: true

module AdminPageLayoutOverride
  def build_active_admin_head
    render 'admin/layout'
  end
end

ActiveAdmin::Views::Pages::Base.prepend AdminPageLayoutOverride
