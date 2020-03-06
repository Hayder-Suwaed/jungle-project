class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.string :percent_of
      t.string :start_on
      t.string :ends_on

      t.timestamps null: false
    end
  end
end
