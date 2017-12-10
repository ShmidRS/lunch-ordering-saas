require 'rails_helper'

RSpec.describe User do
  describe 'creating an admin' do
    context 'first_user_is_admin config is enabled' do
      before { Rails.configuration.first_user_is_admin = true }

      it 'creates the first user with admin rights' do
        first_user = User.create(email: 'bob@bob.com', password: '12345678')
        second_user = User.create(email: 'ned@ned.com', password: '12345678')

        expect(first_user.admin).to eq(true)
        expect(second_user.admin).to eq(false)
      end
    end

    context 'first_user_is_admin config is disabled' do
      before { Rails.configuration.first_user_is_admin = false }

      it 'creates all users without admin rights' do
        first_user = User.create(email: 'bob@bob.com', password: '12345678')
        second_user = User.create(email: 'ned@ned.com', password: '12345678')

        expect(first_user.admin).to eq(false)
        expect(second_user.admin).to eq(false)
      end
    end
  end
end
