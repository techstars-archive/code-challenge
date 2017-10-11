require 'rails_helper'

RSpec.describe Company, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:location) }
  end

  describe 'associations' do
    it { should have_many(:founders) }
    it { should have_one(:location) }
    it { should have_many(:taggings) }
    it { should have_many(:categories).through(:taggings) }

  end

end