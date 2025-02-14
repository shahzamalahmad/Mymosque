class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :role
  # has_secure_password
  validates :email, presence:true, uniqueness: true
  validates :role_id, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
