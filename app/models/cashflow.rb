class Cashflow < ApplicationRecord
  belongs_to :position, optional: true
end
