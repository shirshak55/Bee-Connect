# frozen_string_literal: true

RSpec.describe Post, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:postable) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_length_of(:content).is_at_most(5000) }
  end
end
