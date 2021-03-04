class AddDateToTimelog < ActiveRecord::Migration[6.0]
  def change
    add_column :timelogs, :date, :date
  end
end
