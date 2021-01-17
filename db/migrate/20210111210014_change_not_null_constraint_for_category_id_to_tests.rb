class ChangeNotNullConstraintForCategoryIdToTests < ActiveRecord::Migration[6.0]
  def up
    category = Category.first
    Test.all.each { |test| test.update!(category_id: category.id) if test.category_id.eql?(nil) }

    change_column_null :tests, :category_id, false
  end

  def down
    change_column_null :tests, :category_id, true
  end
end
