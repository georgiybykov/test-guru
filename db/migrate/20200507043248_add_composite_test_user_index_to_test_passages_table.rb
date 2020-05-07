class AddCompositeTestUserIndexToTestPassagesTable < ActiveRecord::Migration[6.0]
  def change
    add_index :test_passages, [:test_id, :user_id], unique: true
  end
end
