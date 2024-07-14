# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :timeoutable, :validatable
  has_many :games, inverse_of: :owner, dependent: :destroy
  belongs_to :role, inverse_of: :users, dependent: nil

  def self.ransackable_attributes(_auth_object = nil)
    %w[confirmed_at created_at email first_name id last_name reset_password_sent_at
       reset_password_token role_id unconfirmed_email updated_at]
  end

  def self.all_names
    all.map { |u| ["#{u.first_name} #{u.last_name}", u.id] }
  end

  def admin?
    admin_role = Role.find_by(name: 'Admin')
    admin_role.present? && role == admin_role
  end
end
