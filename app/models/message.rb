class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  mount_uploader :image, ImagesUploader

  validates :group_id, presence: true
end
