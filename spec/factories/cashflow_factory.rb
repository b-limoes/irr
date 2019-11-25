# frozen_string_literal: true

FactoryBot.define do
  factory :cashflow do
    amount { 1_000 }
    due_date { Date.parse('13-10-2020') }
  end
end
