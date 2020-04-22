class AddIndexToTitleColumnInTestTable < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :title, unique: true
  end
end
