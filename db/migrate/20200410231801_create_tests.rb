class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, limit: 30
      t.integer :level
      t.boolean :presence

      t.timestamps
    end
  end
end
