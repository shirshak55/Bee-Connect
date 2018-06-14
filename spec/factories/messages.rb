# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    body {Faker::Hipster.paragraph(3)}
    association :user
    chat_room_id 1
  end
end
