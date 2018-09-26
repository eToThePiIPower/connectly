require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_length_of(:username).is_at_least(6).is_at_most(32) }
  it { should_not allow_value('user@example.com').for(:username) }
  it { should allow_value('user.name').for(:username) }

  it { should have_one(:profile).dependent(:destroy) }
end
