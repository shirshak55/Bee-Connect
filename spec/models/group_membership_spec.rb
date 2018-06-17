# frozen_string_literal: true

RSpec.describe GroupMembership, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:role) }
  end
end
