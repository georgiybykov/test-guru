# frozen_string_literal: true

module Badges
  # Checks the assigment conditions for each badge to resolve if the user has achieved it or not.
  class AssignBadgesService
    # @param test_passage [TestPassage]
    # @param current_user [User]
    def initialize(test_passage:, current_user:)
      @test_passage = test_passage
      @user = current_user
    end

    # @return [Array<Badge>]
    def fetch_assigned_badges
      return [] unless test_passage.success?

      achived_badges = Badge.all.select { |badge| badge if send(badge.rule.to_sym, badge.rule_value.to_i) }

      user.badges << achived_badges if achived_badges.any?

      achived_badges
    end

    private

    attr_reader :test_passage, :user

    def first_attempt_passed?(_unused)
      passages = TestPassage
                   .by_user_id(user.id)
                   .successfully_passed
                   .where(test_id: test_passage.test_id)
                   .count

      passages == 1
    end

    def all_tests_for_level?(rule_value)
      test_level = test_passage.test.level

      return unless test_level.eql?(rule_value)

      passed_tests_ids = TestPassage
                           .joins(:test)
                           .by_user_id(user.id)
                           .successfully_passed
                           .where(tests: { level: test_level })
                           .pluck(:test_id)
                           .uniq

      certain_level_tests_ids = Test
                                  .with_level(test_level)
                                  .pluck(:id)

      result = certain_level_tests_ids - passed_tests_ids

      result.empty?
    end

    def all_tests_for_category?(rule_value)
      category_id = test_passage.test.category_id

      return unless category_id.eql?(rule_value)

      passed_tests_ids = TestPassage
                           .joins(:test)
                           .by_user_id(user.id)
                           .successfully_passed
                           .where(tests: { category_id: category_id })
                           .pluck(:test_id)
                           .uniq
                           .sort!

      certain_category_tests_ids = Test
                                     .for_category(category_id)
                                     .pluck(:id)
                                     .sort!

      passed_tests_ids == certain_category_tests_ids
    end
  end
end
