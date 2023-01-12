class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.integer :salesperson_id
      t.string :customer_first_name
      t.string :customer_last_name
      t.integer :units_sold
      t.integer :revenue
    end
  end
end
