# frozen_string_literal: true

class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def self.by_rules(rule, rule_value)
    joins(:badge)
      .where(badges: { rule: rule, rule_value: rule_value })
  end
end
