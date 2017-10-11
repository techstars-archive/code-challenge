class Company < ActiveRecord::Base

  has_many :founders, dependent: :destroy
  has_one :location 
  has_many :taggings, dependent: :destroy
  has_many :categories, through: :taggings

  accepts_nested_attributes_for :location

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  def tag_list
    self.categories.collect do |category|
      category.name
    end.join(", ")
  end

  def tag_list=(categories_string)
    category_names = categories_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = category_names.collect { |name| Category.find_or_create_by(name: name) }
    self.categories = new_or_found_tags
  end
end