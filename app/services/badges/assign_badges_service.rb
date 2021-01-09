# frozen_string_literal: true

module Badges
  # Checks the assigment conditions for each badge to resolve if the user has achieved it or not.
  class AssignBadgesService
    # @param test_passage [TestPassage]
    # @param current_user [User]
    # @param test_passage_repo [TestPassageRepository]
    #
    # @return [Array<Badge>, false]
    def initialize(test_passage:, current_user:, test_passage_repo: TestPassageRepository.new)
      @test_passage = test_passage
      @user = current_user

      @test_passage_repo = test_passage_repo
    end

    def call
      return false unless @test_passage.success?

      achived_badges = Badge.all.select { |badge| badge if send(badge.rule.to_sym, badge.rule_value.to_i) }

      if achived_badges.any?
        @user.badges << achived_badges

        achived_badges
      else
        false
      end
    end

    private

    def first_attempt_passage?(_unused)
      passages = @test_passage_repo
                   .list_of_user_passages_for_test(@user.id, @test_passage.test_id)
                   .count

      passages == 1
    end

    def all_tests_for_level?(rule_value)
      return unless @test_passage.test.level.eql?(rule_value)

      test_level = @test_passage.test.level

      passed_tests_ids = @test_passage_repo
                           .list_of_user_passages_by_test_level(@user.id, test_level)
                           .pluck(:test_id)
                           .uniq!

      certain_level_tests_ids = Test
                                  .with_level(test_level)
                                  .pluck(:id)

      result = certain_level_tests_ids - passed_tests_ids

      result.empty?
    end

    def all_tests_for_category?(rule_value)
      category_id = @test_passage.test.category_id

      return unless category_id.eql?(rule_value)

      passed_tests_ids = @test_passage_repo
                           .list_of_user_passages_by_category(@user.id, category_id)
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
