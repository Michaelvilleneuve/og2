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

  test 'update resources changes according to time spent since last update' do
    freeze_time
    copper = factories(:copper)
    assert_equal 0, copper.resources
    travel 1.second
    freeze_time
    copper.update_resources!
    assert copper.resources.positive?
  end

  test 'resources can only be updated when enough time has elapsed' do
    freeze_time
    gold_factory = factories(:gold)
    copper_factory = factories(:copper)
    travel 10.seconds
    assert copper_factory.can_update_resources?
    assert_not gold_factory.can_update_resources?
    travel 51.seconds
    assert gold_factory.can_update_resources?
  end

  test 'ensure a factory has upper levels before upgrading' do
    gold_factory = factories(:gold)
    assert gold_factory.upper_level?
    gold_factory.level = 5
    assert_not gold_factory.upper_level?
  end

  test 'ensure a factory has enough resources to upgrade' do
    player = players(:one)
    gold_factory = player.factories.find_by(type: Factories::Gold.to_s)

    assert_not gold_factory.enough_resources_to_upgrade?, "shouldn't be upgradeable without resources"

    gold_factory.update!(resources: 10)
    player.factories.find_by(type: Factories::Copper.to_s).update!(resources: 110)
    player.factories.find_by(type: Factories::Gold.to_s).update!(resources: 4)

    assert gold_factory.enough_resources_to_upgrade?
  end

  test 'ensure enough time elapsed before upgrading' do
    gold_factory = factories(:gold)
    assert_not gold_factory.enough_time_elapsed_since_last_upgrade?

    travel 20.seconds
    assert gold_factory.enough_time_elapsed_since_last_upgrade?

    gold_factory.level = 2
    assert_not gold_factory.enough_time_elapsed_since_last_upgrade?

    travel 20.seconds
    assert gold_factory.enough_time_elapsed_since_last_upgrade?
  end

  test 'upgrading deducts resources from factories' do
    player = players(:one)
    gold_factory = player.factories.find_by(type: Factories::Gold.to_s)
    copper_factory = player.factories.find_by(type: Factories::Copper.to_s)

    copper_factory.update!(resources: 110)
    gold_factory.update!(resources: 4)
    travel 30.seconds

    gold_factory.upgrade!
    assert_equal 2, gold_factory.reload.resources
    assert_equal 10, copper_factory.reload.resources
  end
end
