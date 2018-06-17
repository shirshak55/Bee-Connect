# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    user_name             { Faker::Internet.user_name(2..20) }
    email                 { Faker::Internet.email(user_name) }
    bio                   { Faker::Hipster.paragraph(3) }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    password              { 'testing' }
    password_confirmation { 'testing' }
    is_female             false
    role                  { Role.where(name: 'registered').first_or_create! }
    confirmed_at          { Time.current }
  end
end
