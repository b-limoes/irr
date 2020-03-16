require 'bigdecimal/newton'
require 'rounding'

class Position < ApplicationRecord
  include Newton

  has_many :cashflows

  values = {
    eps: '1.0e-16',
    one: '1.0',
    two: '2.0',
    ten: '10.0',
    zero: '0.0'
  }

  values.each do |key, value|
    define_method key do
      BigDecimal(value)
    end
  end

  def values(rate)
    rate  = rate.first
    start = cashflows[0].due_date

    [
      cashflows.reduce(0) do |acc, flow|
        date_diff = flow.due_date - start
        acc + flow.amount / ((1 + rate)**(date_diff / 365))
      end
    ]
  end

  def irr
    func = self
    guess = [func.eps]
    nlsolve(func, guess)
    guess[0].to_f.round_to 0.0005
  end
end
