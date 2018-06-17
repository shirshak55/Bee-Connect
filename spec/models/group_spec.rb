# frozen_string_literal: true

RSpec.describe Group, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:group_memberships) }
    it { is_expected.to have_many(:members).through(:group_memberships) }
    it { is_expected.to have_many(:group_message).dependent(:destroy) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of :thumbnail_image }
    it { is_expected.to validate_presence_of :timeline_image }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
  end
end
