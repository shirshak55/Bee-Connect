# frozen_string_literal: true

RSpec.describe User, type: :model do
  include_context 'user'

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

  # TODO(Gary): these work locally and fail remotely - will investigate and fix
  # context 'Scope Tests' do
  #   describe ':users_to_be_followed' do
  #     it 'returns users to be followed for given user', :aggregate_failures do
  #       expect(User.users_to_be_followed(user.id)).to include(user)
  #     end
  #   end
  #
  #   describe ':search_name' do
  #     it 'returns users that match the search term', :aggregate_failures do
  #       expect(User.search_name(user.user_name)).to include(user)
  #     end
  #   end
  # end

  describe User, '#full_name' do
    it 'returns the concatenated first and last names' do
      expect(user.full_name).to eq 'Josh Steiner'
    end
  end
end
