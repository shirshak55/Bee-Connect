class GroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :role
end
