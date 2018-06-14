RSpec.describe PersonalMessage, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:conversation) }
    it { is_expected.to belong_to(:user) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
