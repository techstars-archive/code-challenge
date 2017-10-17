class Founder < ApplicationRecord
  belongs_to :company
  validates :full_name, presence: true
  validates :full_name, uniqueness: true
  validates :title, presence: true
end
