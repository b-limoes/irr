# frozen_string_literal: true

FactoryBot.define do
  factory :position do
    purchase_price { 10_000 }
    maturity_date { Date.parse('13-10-2020') }
  end
end
