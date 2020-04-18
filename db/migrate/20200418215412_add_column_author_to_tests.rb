class AddColumnAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author, :bigint, default: nil, null: false
  end
end
