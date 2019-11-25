# frozen_string_literal: true

require 'rails_helper'

describe Position do
  it { is_expected.to have_many :cashflows }

  it 'comes valid from factory' do
    expect(build(:position)).to be_valid
  end

  describe '#irr' do
    it 'returns internal rate of return' do
      position = create(:position, purchase_price: 10_000, maturity_date: Date.parse('22-11-2024'))
      position.cashflows << create(:cashflow, amount: -10_000, due_date: Date.parse('22-11-2019'))
      position.cashflows << create(:cashflow, amount: 10_500, due_date: Date.parse('22-11-2020'))

      expect(position.irr).to eq(0.05)
    end

    context 'more complex cashflows' do
      it 'returns internal rate of return' do
        position = create(:position, purchase_price: 123_000, maturity_date: Date.parse('19-4-2031'))
        position.cashflows << create(:cashflow, amount: -123_000, due_date: Date.parse('22-11-2019'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2020'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2021'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2022'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2023'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2024'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2025'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2026'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2027'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2028'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2029'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2030'))
        position.cashflows << create(:cashflow, amount: -1246, due_date: Date.parse('19-4-2031'))
        position.cashflows << create(:cashflow, amount: 175_500, due_date: Date.parse('19-4-2031'))

        expect(position.irr).to be_within(0.0001).of(0.0219)
      end
    end
  end
end
