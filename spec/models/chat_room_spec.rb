RSpec.describe ChatRoom, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:messages) }
  end
end
