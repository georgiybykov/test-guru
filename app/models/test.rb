class Test < ApplicationRecord
  def self.test_titles_by_category(category_title)
    joins( "JOIN categories ON categories.id = tests.category_id" )
      .where( categories: { title: category_title })
        .order(title: :desc)
          .pluck(:title)
  end
end
