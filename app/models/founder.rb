class Founder < ApplicationRecord
	validates :name, presence: true
	validate :one_founder
	belongs_to :company

	def one_founder
		@founder = Founder.where(name: self.name).count
		if @founder > 0
			errors.add(:name, "#{self.name} is already a founder of a company ")
		end
	end
end
