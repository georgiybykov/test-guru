class AddResultToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :result, :integer
  end
end
