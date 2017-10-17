class Company < ApplicationRecord
  has_many :founders, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
