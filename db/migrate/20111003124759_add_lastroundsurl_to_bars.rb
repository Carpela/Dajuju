class AddLastroundsurlToBars < ActiveRecord::Migration
  def change
    add_column :bars, :lr_url, :string
  end
end
