# frozen_string_literal: true

require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  test "factory specific properties change with level" do
    factory = factories(:copper)
    assert_equal factory.production_per_second, Factories::Copper::LEVELS[1][:production_per_second]
    assert_equal factory.upgrade_cost, Factories::Copper::LEVELS[1][:upgrade_cost]
  end

  test "upgrade duration changes with level" do
    factory = factories(:copper)
    assert_equal factory.next_upgrade_duration_in_seconds, 15
    factory.level_up!
    assert_equal factory.next_upgrade_duration_in_seconds, 30
  end
end
