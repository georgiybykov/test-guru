class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, limit: 20
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
