require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should have_db_column(:id).of_type(:uuid) }
  it { should have_db_column(:primary).of_type(:boolean) }
  it { should have_db_column(:address_type).of_type(:integer) }
  it { should have_db_column(:body)
    .of_type(:jsonb)
    .with_options(null: false, default: '{}') }
  it { should have_db_index([:addressable_type, :addressable_id]) }

  it { should define_enum_for(:address_type).with([:work, :home]) }

  it { should belong_to(:addressable) }

  it { should validate_presence_of(:addressable_id) }
end
