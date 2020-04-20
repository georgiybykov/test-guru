class AddReferencesBetweenTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, null: false, foreign_key: true, index: { unique: true }
    add_reference :questions, :test, null: false, foreign_key: true, index: { unique: true }
    add_reference :answers, :question, null: false, foreign_key: true, index: { unique: true }
    add_reference :tests, :author, null: false, foreign_key: { to_table: :users}, index: { unique: true }
  end
end
