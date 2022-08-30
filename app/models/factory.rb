# frozen_string_literal: true

class Factory < ApplicationRecord
  belongs_to :player

  def production_per_second
    0
  end

  def next_upgrade_duration
    0
  end

  def upgrade_cost
    0
  end
end
