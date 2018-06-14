# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content       { Faker::Hipster.paragraph(3) }
    association   :user
    postable_type 'User'
    postable_id   1
  end
end
