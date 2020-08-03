class Post < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
  validates :condition, presence: true
  validates :burden, presence: true
  validates :area, presence: true
  validates :day, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user 
  belongs_to :category 
  has_many :images 
end
