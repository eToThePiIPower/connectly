require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  # it { should have_one_attached :avatar }

  describe '.avatar?' do
    it 'should return true when an avatar is attached' do
      profile = create(:profile)
      file = File.open(Rails.root.join('spec', 'factories', 'images', 'test.png'))
      profile.avatar.attach(io: file, filename: 'test.png', content_type: 'image/png')

      expect(profile.avatar?).to eq true
    end

    it 'should return false when an avatar is not attached' do
      profile = create(:profile)

      expect(profile.avatar?).to eq false
    end
  end
end
