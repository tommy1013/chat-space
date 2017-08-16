class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :name, presence: true
end
