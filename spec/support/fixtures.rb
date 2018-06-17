# frozen_string_literal: true

RSpec.shared_context 'user', user: true do
  before(:all) do
    @user = TestProf::AnyFixture.register(:user) do
      FactoryBot.create(:user, first_name: 'Josh', last_name: 'Steiner')
    end
  end

  let(:user) { @user }
end

RSpec.shared_context 'user1', user: true do
  before(:all) do
    @user1 = TestProf::AnyFixture.register(:user1) do
      FactoryBot.create(:user)
    end
  end

  let(:user1) { @user1 }
end

RSpec.shared_context 'user2', user: true do
  before(:all) do
    @user2 = TestProf::AnyFixture.register(:user2) do
      FactoryBot.create(:user)
    end
  end

  let(:user2) { @user2 }
end

RSpec.shared_context 'user3', user: true do
  before(:all) do
    @user3 = TestProf::AnyFixture.register(:user3) do
      FactoryBot.create(:user)
    end
  end

  let(:user3) { @user3 }
end
