RSpec.describe Conversation, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to belong_to(:receiver).class_name('User') }
    it { is_expected.to have_many(:personal_messages).dependent(:destroy) }
  end

  context 'Model Validations' do
    # TODO: the following test is either broken or the code is tests is incorrect
    # it { is_expected.to validate_uniqueness_of(:author).scoped_to(:receiver) }
  end
end
