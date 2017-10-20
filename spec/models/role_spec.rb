# frozen_string_literal: true

RSpec.describe Role, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:users) }
  end
end
