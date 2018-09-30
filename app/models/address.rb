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
  enum address_type: { work: 0, home: 1 }

  belongs_to :addressable, polymorphic: true

  validates :addressable_id,
    presence: true
end
