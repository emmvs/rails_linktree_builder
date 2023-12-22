require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { create(:link) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(link).to be_valid
    end

    it 'is not valid without a title' do
      link.title = nil
      expect(link).not_to be_valid
    end
  end

  describe 'click tracking' do
    before do
      # Setup necessary attributes if required
      link.user_agent = "Mozilla/5.0"
      link.device_type = "desktop"
      link.country = "USA"
      link.city = "New York"
      link.save!
    end

    it 'increments click_count' do
      expect { link.track_click }.to change { link.reload.click_count }.by(1)
    end

    it 'updates last_clicked_at' do
      expect { link.track_click }.to change(link, :last_clicked_at)
    end

    it 'updates user_agent' do
      new_user_agent = "Mozilla/5.0 (iPhone)"
      expect { link.track_click(user_agent: new_user_agent) }.to change { link.reload.user_agent }.to(new_user_agent)
    end

    it 'updates device_type' do
      new_device_type = "mobile"
      expect { link.track_click(device_type: new_device_type) }.to change { link.reload.device_type }.to(new_device_type)
    end
  end
end
