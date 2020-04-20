class CreateTableTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :tests, :users do |t|
      t.index [:test_id, :user_id], unique: true

      t.timestamps
    end

    add_foreign_key :tests_users, :tests
    add_foreign_key :tests_users, :users
  end
end
