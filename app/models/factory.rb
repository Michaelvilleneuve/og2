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
    update!(resources: resources + newly_created_resources)
  end
end
