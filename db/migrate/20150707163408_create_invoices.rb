class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer   :pos_id
      t.integer   :customer_id
      t.float     :total, scale: 2

      t.timestamps
    end
  end
end
