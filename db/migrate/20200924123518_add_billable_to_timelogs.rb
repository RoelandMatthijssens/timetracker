class AddBillableToTimelogs < ActiveRecord::Migration[6.0]
  def change
    add_column :timelogs, :billable, :boolean, default: true
  end
end
