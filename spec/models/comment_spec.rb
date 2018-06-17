# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user).required(true) }
    it { is_expected.to belong_to(:post).required(true) }
  end
end
