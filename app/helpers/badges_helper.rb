# frozen_string_literal: true

module BadgesHelper
  def badge_rule_names
    BadgeService.rules.each_with_object([]) do |rule, memo|
      memo << [I18n.t("helpers.badge_rule_names.#{rule}"), rule]
    end
  end

  def badge_rule_values
    badge_rule_names.each_with_object({}) do |(trule, rule), memo|
      memo[trule] = BadgeService.values_of_rule(rule)
    end
  end
end
