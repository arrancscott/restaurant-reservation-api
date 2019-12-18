# frozen_string_literal: true

require 'rails_helper'

describe OpeningTime do
  context 'when day_of_week is monday' do
    it 'returns true when monday? is called' do
      opening_time = build(:reservation, :monday)
      expect(opening_time.monday?).to eq(true)
    end
  end

  context 'when day_of_week is tuesday' do
    it 'returns true when tuesday? is called' do
      opening_time = build(:reservation, :tuesday)
      expect(opening_time.tuesday?).to eq(true)
    end
  end

  context 'when day_of_week is wednesday' do
    it 'returns true when wednesday? is called' do
      opening_time = build(:reservation, :wednesday)
      expect(opening_time.wednesday?).to eq(true)
    end
  end

  context 'when day_of_week is thursday' do
    it 'returns true when thursday? is called' do
      opening_time = build(:reservation, :thursday)
      expect(opening_time.thursday?).to eq(true)
    end
  end

  context 'when day_of_week is friday' do
    it 'returns true when friday? is called' do
      opening_time = build(:opening_time, :friday)
      expect(opening_time.friday?).to eq(true)
    end
  end

  context 'when day_of_week is saturday' do
    it 'returns true when saturday? is called' do
      opening_time = build(:opening_time, :saturday)
      expect(opening_time.saturday?).to eq(true)
    end
  end

  context 'when day_of_week is sunday' do
    it 'returns true when sunday? is called' do
      opening_time = build(:opening_time, :sunday)
      expect(opening_time.sunday?).to eq(true)
    end
  end
end
