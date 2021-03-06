class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :message_or_image, presence: true
  mount_uploader :image, ImageUploader
end

private
def message_or_image
  message.presence or image.presence
end
