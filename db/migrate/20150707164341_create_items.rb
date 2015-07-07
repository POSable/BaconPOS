class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string    :name
      t.text      :description
      t.float     :price, scale: 2

      t.timestamps
    end
  end
end
