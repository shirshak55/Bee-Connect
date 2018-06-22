# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body { Faker::Hipster.paragraph(1) }
    association :user
    association :chat_room
  end
end
