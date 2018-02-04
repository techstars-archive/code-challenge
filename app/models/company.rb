class Company < ApplicationRecord
	validates :name, presence: true
	has_one :founder
end
