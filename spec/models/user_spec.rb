# frozen_string_literal: true

require 'rails_helper'

describe User do
  context 'when role is admin' do
    it 'returns true when admin? is called' do
      user = create(:user)
      expect(user.admin?).to eq(true)
    end
  end

  context 'when role is restaurant' do
    it 'returns true when restaurant? is called' do
      user = create(:user, :restaurant)
      expect(user.restaurant?).to eq(true)
    end
  end

  context 'when role is guest' do
    it 'returns true when guest? is called' do
      user = create(:user, :guest)
      expect(user.guest?).to eq(true)
    end
  end
end
