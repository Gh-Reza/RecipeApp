class User < ApplicationRecord
  has_many :recipes
  has_many :foods
  validates :name, presence: true
end
