# Contacts: Represents a specific person the user wishes to keep track of
# communications (i.e. Connections) with and various commitments (i.e. Promises)
# made to
class Contact < ApplicationRecord
  validates :name,
    presence: true
  belongs_to :user
end
