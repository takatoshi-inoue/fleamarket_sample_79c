class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true
  validates :encrypted_password,  presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_day, presence: true
  validates :birth_month, presence: true
  validates :birth_year, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
end
