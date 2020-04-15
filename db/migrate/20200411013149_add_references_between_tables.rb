class AddReferencesBetweenTables < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, foreign_key: true
    add_reference :questions, :test, foreign_key: true
    add_reference :answers, :question, foreign_key: true
    add_reference :results, :test, foreign_key: true
    add_reference :results, :user, foreign_key: true

    change_column_null :tests, :category_id, false
    change_column_null :questions, :test_id, false
    change_column_null :answers, :question_id, false
    change_column_null :results, :test_id, false
    change_column_null :results, :user_id, false
  end
end
