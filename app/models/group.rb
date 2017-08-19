class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true

  def show_last_messages
    if self.messages.present?
      return self.messages.last.body
    else
      return 'まだメッセージがありません'
    end
  end
end
