class CreateTimelogs < ActiveRecord::Migration[6.0]
  def change
    create_table :timelogs do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :amount

      t.timestamps
    end
  end
end
