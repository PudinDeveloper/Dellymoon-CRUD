class Ticket < ApplicationRecord
  validates :table, presence: true
  validates :user_id, presence: true
end
