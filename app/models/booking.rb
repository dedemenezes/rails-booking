class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  STATUS_ENUM = { accepted: 0, denied: 1, pending: 2 }
  enum status: STATUS_ENUM
end
