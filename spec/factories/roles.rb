# frozen_string_literal: true

FactoryGirl.define do
  factory :role do
    sequence :name do |n|
      "#{Faker::Company.profession} #{n}"
    end
  end
end
