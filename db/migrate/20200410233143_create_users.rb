class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 20
      t.string :email, limit: 40
      t.string :password_digest

      t.timestamps
    end
  end
end
