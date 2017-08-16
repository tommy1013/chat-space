class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :group_id, presence: true
end
