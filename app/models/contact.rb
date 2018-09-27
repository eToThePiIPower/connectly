# Contacts: Represents a specific person the user wishes to keep track of
# communications (i.e. Connections) with and various commitments (i.e. Promises)
# made to
class Contact < ApplicationRecord
  default_scope -> { order('created_at ASC') }
  validates :name,
    presence: true
  belongs_to :user
end
