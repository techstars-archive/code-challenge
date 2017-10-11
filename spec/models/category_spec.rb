require 'rails_helper'

RSpec.describe Category, type: :model do
   it { should have_many(:companies).through(:taggings)}
   it { should have_many(:taggings) }

end
