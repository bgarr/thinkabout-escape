# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_user)
    games_path
  end

  def require_admin_role!
    return if current_user&.admin?

    render plain: 'Not Authorized', status: :unauthorized
  end
end
