# frozen_string_literal: true

require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  test 'factory specific properties change with level' do
    factory = factories(:copper)
    assert_equal factory.production_per_second, Factories::Copper::LEVELS[1][:production_per_second]
    assert_equal factory.upgrade_cost, Factories::Copper::LEVELS[1][:upgrade_cost]
  end

  test 'upgrade duration changes with level' do
    factory = factories(:copper)
    assert_equal factory.next_upgrade_duration_in_seconds, 15
    factory.level_up!
    assert_equal factory.next_upgrade_duration_in_seconds, 30
  end

  test "update resources changes according to time spent since last update" do
    freeze_time
    copper = factories(:copper)
    assert_equal 0, copper.resources
    travel 10.seconds
    copper.update_resources!
    assert_equal 10 * copper.production_per_second, copper.resources
  end

  test "resources can only be updated when enough time has elapsed" do
    freeze_time
    gold_factory = factories(:gold)
    copper_factory = factories(:copper)
    travel 10.seconds
    assert copper_factory.can_update_resources?
    assert_not gold_factory.can_update_resources?
    travel 51.seconds
    assert gold_factory.can_update_resources?
  end
end
