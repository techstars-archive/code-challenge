class Company < ActiveRecord::Base

  has_many :founders
  has_one :location 
  accepts_nested_attributes_for :location

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
end
