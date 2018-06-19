# frozen_string_literal: true

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user, first_name: 'Josh', last_name: 'Steiner') }

  context 'Model Associations' do
    it { is_expected.to belong_to(:role) }

    it { is_expected.to have_many(:chat_rooms) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:messages) }
    it { is_expected.to have_many(:personal_messages) }
    it { is_expected.to have_many(:group_memberships) }
    it { is_expected.to have_many(:group_messages) }
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:notifications).with_foreign_key('recipient_id') }
    it { is_expected.to have_many(:authored_conversations).class_name('Conversation').with_foreign_key('author_id') }
    it { is_expected.to have_many(:received_conversations).class_name('Conversation').with_foreign_key('receiver_id') }
    it { is_expected.to have_many(:follower_relationships).class_name('Follow').with_foreign_key('following_id') }
    it { is_expected.to have_many(:followers).through('follower_relationships') }
    it { is_expected.to have_many(:following_relationships).class_name('Follow').with_foreign_key('follower_id') }
    it { is_expected.to have_many(:following).through('following_relationships') }
  end

  context 'Model Validations' do
    it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_length_of(:user_name).is_at_least(2).is_at_most(50) }
    it { is_expected.to validate_uniqueness_of(:user_name).case_insensitive }

    # TODO: write tests for :user_name format - the following is no longer valid
    # it { is_expected.to validate_format_of(:user_name).case_insensitive }
  end

  describe User, '#full_name' do
    it 'returns the concatenated first and last names' do
      expect(user.full_name).to eq 'Josh Steiner'
    end
  end
end
