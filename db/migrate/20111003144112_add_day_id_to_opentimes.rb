class AddDayIdToOpentimes < ActiveRecord::Migration
  def up
    add_column :opentimes, :day_id, :integer
    day_names = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}
  
    Opentime.all.each do |time|
      if day_names.index(time.days)
        time.update_attributes! :day_id => day_names.index(time.days)
      end
    end
  end

  def down
    remove_column :opentimes, :day_id, :integer
  end
end


