class UniversityMembership < ApplicationRecord
  belongs_to :user
  belongs_to :university
  belongs_to :role
end
