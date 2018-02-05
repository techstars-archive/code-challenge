require 'rails_helper'

describe Tagging, type: :model do
	it { should belong_to(:company) }
    it { should belong_to(:category) }
end
