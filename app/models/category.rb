class Category < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :companies, through: :taggings

  def to_s
    name
  end 
end