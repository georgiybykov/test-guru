# frozen_string_literal: true

module Badges
  class CreateBadgeService
    def initialize(test_passage:, test_passage_repo: TestPassageRepository.new)
      @test_passage = test_passage
      @user = test_passage.user

      @test_passage_repo = test_passage_repo
    end

    def call
      Badge.all.select { |badge| badge if send(badge.rule.to_sym, badge.rule_value.to_i) }
    end

    private

    def first_attempt_passage?(_unused)
      return unless @test_passage.success?

      passages = @test_passage_repo
                   .list_of_user_passages_for_test(@user.id, @test_passage.test_id)
                   .count

      passages == 1
    end

    def all_tests_for_level?(rule_value)
      return unless @test_passage.success? && @test_passage.test.level.eql?(rule_value)

      test_level = @test_passage.test.level

      passed_tests_ids = @test_passage_repo
                           .list_of_user_passages_by_test_level(@user.id, test_level)
                           .pluck(:test_id)
                           .uniq!

      all_tests_ids = Test
                        .with_level(test_level)
                        .pluck(:id)

      result = all_tests_ids - passed_tests_ids

      result.empty?
    end

    def all_tests_for_category?(rule_value)
      return unless @test_passage.success? && @test_passage.test.category_id.eql?(rule_value)

      passed_tests_ids = @test_passage_repo
                           .list_of_user_passages_by_category(@user.id, @test_passage.test.category_id)
                           .pluck(:test_id)
                           .uniq
                           .sort!

      all_tests_ids = Test
                        .for_category(@test_passage.test.category_id)
                        .pluck(:id)
                        .sort!

      passed_tests_ids == all_tests_ids
    end
  end
end
