class CreateSalespeople < ActiveRecord::Migration[6.1]
  def change
    create_table :salespeople do |t|
      t.string :first_name
      t.string :last_name
      t.integer :quota
    end
  end
end
