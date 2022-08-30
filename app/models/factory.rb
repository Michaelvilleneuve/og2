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
    level * 15
  end
end
