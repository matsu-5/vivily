class Room < ApplicationRecord
  has_many :entries
  has_many :direct_messages
  has_many :customers, through: :entries
end
