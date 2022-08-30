# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'has many factories' do
    player = Player.create!(email: 'hello@hunter.io', password: 'azerty')
    assert_equal player.factories.count, 0, 'factories should be an empty collection'
  end
end
