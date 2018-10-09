### Address ###
#
# Store a physical address (as jsonb) and related metainformation
#
# == Schema Information
#
# Table name: addresses
#   Column                Type        Nullable    Default
#   id                    uuid        not null    gen_random_uuid
#   address_type          integer
#   main                  boolean
#   body               jsonb       not null    default '{}'
#   addressable_type      varchar
#   addressable_id        uuid
#   created_at            datetime    not null
#   updated_at            datetime    not null
#
class Address < ApplicationRecord
  ADDRESS_TYPES = [:work, :home, :other].freeze

  default_scope -> { order('created_at ASC') }

  enum address_type: ADDRESS_TYPES

  belongs_to :addressable, polymorphic: true

  validates :addressable,
    presence: true

  validates :address_type,
    presence: true

  # :reek:UncommunicativeMethodName
  def self.ADDRESS_TYPES # rubocop:disable Naming/MethodName
    ADDRESS_TYPES
  end
end
