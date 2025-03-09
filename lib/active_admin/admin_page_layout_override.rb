# frozen_string_literal: true

require 'active_admin'

module AdminPageLayoutOverride
  def build_active_admin_head
    render 'admin/layout'
  end
end

ActiveAdmin::Views::Pages::Base.prepend AdminPageLayoutOverride
