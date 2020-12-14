# frozen_string_literal: true

module Badges
  class CreateBadgeService
    BADGE_ACHIEVEMENT_RULES = %i[first_try? all_level_of? all_for_category?].freeze

    def initialize(test_passage)
      @test_passage = test_passage
      @user = test_passage.user
    end

    def call
      Badge.all.select do |badge|
        badge if send(badge.rule.to_s.to_sym, badge.rule_value)
      end
    end

    private

    def first_try?
      return unless @test_passage.success?

      @user.tests.where(id: @test_passage.test.id).count == 1
    end

    def all_level_of?(rule_value); end

    def all_for_category?(rule_value); end
  end
end
