require 'rails_helper'

RSpec.describe Tagging, type: :model do
   describe 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:category) }
  end
end