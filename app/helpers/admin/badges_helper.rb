# frozen_string_literal: true

module Admin::BadgesHelper
  def badges_rules
    Badge::ACHIEVEMENT_RULES.map { |symbol| [I18n.t(".badge_rules.#{symbol}"), symbol] }
  end

  def show_all_categories_with_ids
    Category.all.map { |category| "#{category.id} - #{category.title}" }
  end
end
