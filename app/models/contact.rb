# Contacts: Represents a specific person the user wishes to keep track of
# communications (i.e. Connections) with and various commitments (i.e. Promises)
# made to
class Contact < ApplicationRecord
  default_scope -> { order('created_at ASC') }

  belongs_to :user
  has_many :addresses, as: :addressable
  accepts_nested_attributes_for :addresses, allow_destroy: true

  validates :name,
    presence: true
end
