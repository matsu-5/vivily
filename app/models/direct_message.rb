class DirectMessage < ApplicationRecord
  belongs_to :customer
  belongs_to :room
  after_create_commit { DirectMessageBroadcastJob.perform_later self }

  attachment :profile_image
end
