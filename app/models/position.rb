class Position < ApplicationRecord
  has_many :cashflows

  def irr
    # TODO: implement irr
  end
end
