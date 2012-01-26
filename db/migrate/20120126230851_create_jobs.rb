class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :path
      t.boolean :daily
      t.integer :priority

      t.timestamps
    end
  end
end
