# frozen_string_literal: true

module Admin::BadgesHelper
  def badges_rules
    Badges::CreateBadgeService::BADGE_ACHIEVEMENT_RULES.map { |k| [I18n.t(".badge_rules.#{k}"), k] }
  end
end
