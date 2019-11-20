class AddPositionIdToCashflows < ActiveRecord::Migration[5.2]
  def change
    add_column :cashflows, :position_id, :integer
  end
end
