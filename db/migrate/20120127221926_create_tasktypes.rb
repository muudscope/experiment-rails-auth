class CreateTasktypes < ActiveRecord::Migration
  def change
    create_table :tasktypes do |t|
      t.string :name
      t.integer :priority
      t.boolean :active

      t.timestamps
    end
  end
end
