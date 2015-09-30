require 'rails_helper'

RSpec.describe Gift, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }

  it { should have_valid(:price).when("300", "499.99") }
  it { should_not have_valid(:price).when(nil, "", "500.01", "23.131") }
end
