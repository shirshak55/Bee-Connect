RSpec.describe Message, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:chat_room) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_least(2).is_at_most(1000) }
  end
end
