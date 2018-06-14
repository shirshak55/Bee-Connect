RSpec.shared_context 'user', user: true do
  before(:all) do
    @user = TestProf::AnyFixture.register(:user) do
      FactoryBot.create(:user, first_name: 'Josh', last_name: 'Steiner')
    end
  end

  let(:user) { @user }
end
