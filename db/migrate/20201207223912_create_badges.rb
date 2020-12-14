class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, limit: 20
      t.string :image
      t.string :rule, null: false
      t.text :description

      t.timestamps
    end

    add_index :badges, :name, unique: true
  end
end
