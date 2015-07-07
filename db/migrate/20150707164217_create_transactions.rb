class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer   :invoice_id
      t.integer   :item_id
      t.integer   :qty

      t.timestamps
    end
  end
end
