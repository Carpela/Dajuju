class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :area
      t.string :type
      t.string :address
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
