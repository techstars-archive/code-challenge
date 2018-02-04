class Category < ApplicationRecord
	has_many :taggings
    has_many :companies, through: :taggings
end
