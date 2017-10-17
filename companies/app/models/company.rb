class Company < ApplicationRecord
  has_many :founders, dependent: :destroy
  has_many :tags, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
