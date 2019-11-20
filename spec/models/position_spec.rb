# frozen_string_literal: true

require 'rails_helper'

describe Position do
  it { is_expected.to have_many :cashflows }
end
