class Message < ApplicationRecord
  mount_uploader :video, VideoUploader
  mount_uploader :thumbnail, ThumbnailUploader

  validates :title, presence: true
  validates :video, presence: true
end
