# frozen_string_literal: true

# Test all factories
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build_stubbed(factory_name).should be_valid
    end
  end
end

# Test user fixtures
describe 'The user1 fixture' do
  include_context 'user1'
  it 'is valid' do
    user1.should be_valid
  end
end

describe 'The user2 fixture' do
  include_context 'user2'
  it 'is valid' do
    user2.should be_valid
  end
end

describe 'The user3 fixture' do
  include_context 'user3'
  it 'is valid' do
    user3.should be_valid
  end
end
