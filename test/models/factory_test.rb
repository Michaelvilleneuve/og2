# frozen_string_literal: true

require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  test "factory properties can be returned depending on level" do
    player = players(:one)
    factory = Factories::Copper.create!(player: player)
    assert_equal factory.production_per_second, Factories::Copper::LEVELS[1][:production_per_second]
    assert_equal factory.upgrade_cost, Factories::Copper::LEVELS[1][:upgrade_cost]
  end
end
