# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    sequence :name do |n|
      "#{Faker::Company.profession} #{n}"
    end
  end
end
