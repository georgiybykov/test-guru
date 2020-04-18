class User < ApplicationRecord
  has_secure_password

  def user_tests_by_level(level)
    Test.joins( "JOIN results ON results.test_id = tests.id" )
          .where( level: level, results: { user_id: id } )
  end
end
