class Company < ApplicationRecord
	validates :name, presence: true
	has_one :founder
	has_many :taggings
    has_many :categories, through: :taggings

    def category_list
    	self.categories.map{ |category| category.name}.join(', ')
    end

    def category_list=(names)
	    self.categories = names.split(',').map do |n|
	      Category.where(name: n.strip).first_or_create!
	    end
	end
end
