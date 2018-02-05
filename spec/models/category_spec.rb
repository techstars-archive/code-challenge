require 'rails_helper'

describe Category do
	it { should have_many(:companies).through(:taggings)}
    it { should have_many(:taggings) }
end
