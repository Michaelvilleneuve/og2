# frozen_string_literal: true

class Factory < ApplicationRecord
  belongs_to :player, optional: true

  def level_properties
    self.class::LEVELS[level]
  end

  def production_per_second
    level_properties[:production_per_second]
  end

  def upgrade_cost
    level_properties[:upgrade_cost]
  end

  def next_upgrade_duration_in_seconds
    return 15 if level == 1

    (level - 1) * 30
  end

  def level_up!
    update!(level: level + 1)
  end

  def can_update_resources?
    resource_updated_at + 1.send(self.class::UPGRADE_RATE) < Time.now
  end

  def seconds_since_last_update
    Time.now.to_i - resource_updated_at.to_i
  end

  def update_resources!
    newly_created_resources = (seconds_since_last_update * production_per_second)
    update!(resources: resources + newly_created_resources, resource_updated_at: Time.now)
  end

  def upgradeable?
    upper_level? && enough_resources_to_upgrade? && enough_time_elapsed_since_last_upgrade?
  end

  def upper_level?
    self.class::LEVELS[level + 1].present?
  end

  def enough_resources_to_upgrade?
    upgrade_cost.map do |resource|
      factory = player.factories.find_by(type: resource[0].to_s)
      factory.resources >= resource[1]
    end.none?(false)
  end

  def enough_time_elapsed_since_last_upgrade?
    Time.now.to_i - upgraded_at.to_i > next_upgrade_duration_in_seconds
  end

  def upgrade!
    raise 'Unable to upgrade' unless upgradeable?

    ActiveRecord::Base.transaction do
      upgrade_cost.each do |resource|
        factory = player.factories.find_by(type: resource[0].to_s)
        factory.update!(resources: factory.resources - resource[1])
      end
      update!(level: level + 1)
    end
  end
end
