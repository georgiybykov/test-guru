class CreateTableTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users, id: false do |t|
      t.references :test, null: false, foreign_key: true, index: { unique: true }
      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
