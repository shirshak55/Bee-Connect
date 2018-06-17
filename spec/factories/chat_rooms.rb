# frozen_string_literal: true

FactoryBot.define do
  factory :chat_room do
    title { Faker::Book.title }
    association :user
  end
end
