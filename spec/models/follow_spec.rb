RSpec.describe Follow, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:follower).class_name('User').with_foreign_key('follower_id').required(true) }
    it { is_expected.to belong_to(:following).class_name('User').with_foreign_key('following_id').required(true) }
  end
end
