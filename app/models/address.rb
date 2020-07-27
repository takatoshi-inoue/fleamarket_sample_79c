class Address < ApplicationRecord
  validates :postal_code, presence: true
  validates :prefectures, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :apartment, presence: true

  belongs_to :user, optional: true
end
