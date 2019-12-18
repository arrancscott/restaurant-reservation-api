# frozen_string_literal: true

require 'rails_helper'

describe Restaurant do
  subject { create(:restaurant) }

  describe '#cuisines' do
    it 'converts the cuisines from their integer values to their string values' do
      expect(subject.cuisines).to be_a(String)
    end
  end

  describe '#cuisines=' do
    it 'converts the cuisines into their integer values from their string values' do
      subject.cuisines = 'Indian, American, Mexican, French, Mediterranean'
      expect(subject.cuisines_before_type_cast).to eq([5, 0, 4, 12, 7])
    end
  end

  describe '#opening_times=' do
    it 'finds or creates an OpeningTime and updates it' do
      opening_time = {
        day_of_week: subject.opening_times.first.day_of_week,
        opening_time: '12:00',
        closing_time: '00:00'
      }
      subject.update(opening_times_attributes: [opening_time])
      expect(subject.opening_times.first.opening_time).to eq('12:00')
      expect(subject.opening_times.first.closing_time).to eq('00:00')
    end
  end
end
