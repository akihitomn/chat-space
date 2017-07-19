class User < ApplicationRecord
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :search_name, -> (keyword, current_user){where('name LIKE(?)', "%#{keyword}%").where.not(id: current_user)}
end
