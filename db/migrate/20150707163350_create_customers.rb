class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string    :name
      t.string    :phone
      t.string    :email
      t.text      :address
      t.string    :cc_type
      t.integer   :cc_last4
      t.string    :cc_auth

      t.timestamps
    end
  end
end
