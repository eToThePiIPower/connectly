require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should have_db_column(:id).of_type(:uuid) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:notes).of_type(:text) }
  it { should have_db_index(:user_id) }

  it { should belong_to(:user) }
  it { should have_many(:addresses) }
  it { should accept_nested_attributes_for(:addresses) }

  it { should validate_presence_of :name }
end
