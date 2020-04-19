class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :authored_tests, foreign_key: :author_id, touch: true
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.test_titles_by_category(category_title)
    joins( "JOIN categories ON categories.id = tests.category_id" )
      .where( categories: { title: category_title })
        .order(title: :desc)
          .pluck(:title)
  end
end
