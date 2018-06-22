# frozen_string_literal: true

RSpec.describe Notification, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:notifiable) }
    it { is_expected.to belong_to(:actor).class_name('User') }
    it { is_expected.to belong_to(:recipient).class_name('User') }
  end
end
