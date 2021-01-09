# frozen_string_literal: true

class TestPassageRepository
  # Returns a list of successfully passed test passages for the user for certain test.
  #
  # @param user_id [Integer]
  # @param test_id [Integer]
  #
  # @return [ActiveRecord::Relation<TestPassage>]
  def list_of_user_passages_for_test(user_id, test_id)
    TestPassage
      .for_user(user_id)
      .successfully_passed
      .where(test_id: test_id)
  end

  # Returns a list of successfully passed test passages for the user for the certain level.
  #
  # @param user_id [Integer]
  # @param test_level [Integer]
  #
  # @return [ActiveRecord::Relation<TestPassage>]
  def list_of_user_passages_by_test_level(user_id, test_level)
    TestPassage
      .joins(:test)
      .for_user(user_id)
      .successfully_passed
      .where("tests.level": test_level)
  end

  # Returns a list of successfully passed test passages for the user for the certain category.
  #
  # @param user_id [Integer]
  # @param category_id [Integer]
  #
  # @return [ActiveRecord::Relation<TestPassage>]
  def list_of_user_passages_by_category(user_id, category_id)
    TestPassage
      .joins(:test)
      .for_user(user_id)
      .successfully_passed
      .where("tests.category_id": category_id)
  end
end
