class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :client
      t.string :name

      t.timestamps
    end
  end
end
