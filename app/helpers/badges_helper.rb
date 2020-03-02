# frozen_string_literal: true

module BadgesHelper
  def badge_rule_names
    BadgeService.rules.map { |rule| [I18n.t("helpers.badge_rule_names.#{rule}"), rule] }
  end

  def badge_rule_values
    badge_rule_names.map { |trule, rule| [trule, BadgeService.values_of_rule(rule)] }
  end
end
