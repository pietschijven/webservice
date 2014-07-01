class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :user
      t.float :cost
      t.integer :common

      t.timestamps
    end
  end
end
