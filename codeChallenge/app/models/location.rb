class Location < ActiveRecord::Base
  belongs_to :company

  validates :city, presence: true
  validates :state, presence: true

end
