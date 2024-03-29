# frozen_string_literal: true

module Badges
  # Checks the assigment conditions for each badge to resolve if the user has achieved it or not.
  class AssignBadgesService
    # @param test_passage [TestPassage]
    # @param current_user [User]
    def initialize(test_passage:, current_user:)
      @test_passage = test_passage
      @user = current_user
      @test = test_passage.test
    end

    # @return [Array<Badge>, ActiveRecord::Relation<Badge>]
    def fetch_assigned_badges
      return [] unless test_passage.success?

      achieved_badges = Badge.all.select do |badge|
        badge if send(badge.rule.to_sym, badge.rule_value.to_i)
      end

      user.badges << achieved_badges if achieved_badges.any?

      achieved_badges
    end

    private

    attr_reader :test_passage, :user, :test

    def first_attempt_passed?(_rule_value)
      previous_passages = TestPassage
                            .by_user_id(user.id)
                            .where(test_id: test.id)
                            .where('updated_at < ?', test_passage.updated_at)
                            .count

      return if previous_passages >= 1

      true
    end

    def all_tests_for_level?(rule_value)
      test_level = test.level

      user_test_level_badges = UserBadge.by_rules(:all_tests_for_level?, rule_value)

      return unless Test.levels[test_level].eql?(rule_value) && user_test_level_badges.count.zero?

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
      category_id = test.category_id

      user_test_category_badges = UserBadge.by_rules(:all_tests_for_category?, rule_value)

      return unless category_id.eql?(rule_value) && user_test_category_badges.count.zero?

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
