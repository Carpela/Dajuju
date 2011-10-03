class CreateOpentimes < ActiveRecord::Migration
  def change
    create_table :opentimes do |t|
      t.integer :bar_id
      t.string :days
      t.string :start
      t.string :finish

      t.timestamps
    end
  end
end
