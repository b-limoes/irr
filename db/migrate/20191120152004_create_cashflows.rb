class CreateCashflows < ActiveRecord::Migration[5.2]
  def change
    create_table :cashflows do |t|
      t.float :amount
      t.date :due_date

      t.timestamps
    end
  end
end
