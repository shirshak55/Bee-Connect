# frozen_string_literal: true

RSpec.describe Conversation, type: :model do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:user3) { FactoryBot.create(:user) }

  # user1 -> user2
  let!(:conversation1) { FactoryBot.create(:conversation, author_id: user1.id, receiver_id: user2.id) }
  # user3 -> user2
  let!(:conversation2) { FactoryBot.create(:conversation, author_id: user3.id, receiver_id: user2.id) }
  # user2 -> user3
  let!(:conversation3) { FactoryBot.create(:conversation, author_id: user2.id, receiver_id: user3.id) }

  context 'Model Associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to belong_to(:receiver).class_name('User') }
    it { is_expected.to have_many(:personal_messages).dependent(:destroy) }
  end

  context 'Model Validations' do
    # TODO: the following test is either broken or the code it tests is incorrect
    # it { is_expected.to validate_uniqueness_of(:author).scoped_to(:receiver) }

    it 'is valid with an author and receiver' do
      conversation = Conversation.new(author_id: user1.id, receiver_id: user3.id)
      expect(conversation).to be_valid
    end

    it 'is invalid without an author' do
      conversation = Conversation.new(author_id: nil, receiver_id: user1.id)
      conversation.valid?
      expect(conversation.errors[:author_id]).to include("can't be blank")
    end

    it 'is invalid without a receiver' do
      conversation = Conversation.new(author_id: user1.id, receiver_id: nil)
      conversation.valid?
      expect(conversation.errors[:receiver_id]).to include("can't be blank")
    end
  end

  context 'Scope Tests' do
    describe ':between' do
      it 'returns conversations that match the search term', :aggregate_failures do
        # user1 -> user2
        expect(Conversation.between(user1.id, user2.id)).to include(conversation1)
        expect(Conversation.between(user1.id, user2.id)).to_not include(conversation2, conversation3)

        # user2 -> user3
        expect(Conversation.between(user2.id, user3.id)).to include(conversation2 || conversation3)
        expect(Conversation.between(user2.id, user3.id)).to_not include(conversation1)

        # user3 -> user1
        expect(Conversation.between(user3.id, user1.id)).to be_empty
      end
    end

    describe ':participating' do
      it 'returns conversations that the given user is participating in', :aggregate_failures do
        # user1 -> conversation 1
        expect(Conversation.participating(user1)).to include(conversation1)
        expect(Conversation.participating(user1)).to_not include(conversation2, conversation3)

        # user2 -> conversation 1, 2, and 3
        expect(Conversation.participating(user2)).to include(conversation1, conversation2, conversation3)

        # user3 -> conversation 2 and 3
        expect(Conversation.participating(user3)).to include(conversation2, conversation3)
        expect(Conversation.participating(user3)).to_not include(conversation1)
      end
    end
  end

  context 'Definition Tests' do
    it 'def participates?(user)', :aggregate_failures  do
      # conversation1: user1 -> user2
      expect(conversation1.participates?(user1)).to eq true
      expect(conversation1.participates?(user2)).to eq true
      expect(conversation1.participates?(user3)).to eq false

      # conversation2: user3 -> user2
      expect(conversation2.participates?(user1)).to eq false
      expect(conversation2.participates?(user2)).to eq true
      expect(conversation2.participates?(user3)).to eq true

      # conversation3: user2 -> user3
      expect(conversation3.participates?(user1)).to eq false
      expect(conversation3.participates?(user2)).to eq true
      expect(conversation3.participates?(user3)).to eq true
    end

    it 'with(current_user)', :aggregate_failures do
      # conversation1: user1 -> user2
      expect(conversation1.with(user1)).to eq user2
      expect(conversation1.with(user2)).to eq user1
      expect(conversation1.with(user3)).to eq user1

      # conversation2: user3 -> user2
      expect(conversation2.with(user1)).to eq user3
      expect(conversation2.with(user2)).to eq user3
      expect(conversation2.with(user3)).to eq user2

      # conversation3: user2 -> user3
      expect(conversation3.with(user1)).to eq user2
      expect(conversation3.with(user2)).to eq user3
      expect(conversation3.with(user3)).to eq user2
    end
  end
end
