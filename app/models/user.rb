class User < ApplicationRecord
  has_secure_password

  def user_tests_by_level(level)
    Test.joins( "JOIN results ON tests.id = test_id" )
        .where( level: level, results: { user_id: id } )
  end
end
