class Position < ApplicationRecord
  include IRR

  has_many :cashflows
end
