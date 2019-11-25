# frozen_string_literal: true

require 'rails_helper'

describe Cashflow do
  it { is_expected.to belong_to(:position).optional }

  it 'comes valid from factory' do
    expect(build(:cashflow)).to be_valid
  end
end
