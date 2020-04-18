class AddReferenceAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, null: false, foreign_key: { to_table: :users}, index: { unique: true }
  end
end
