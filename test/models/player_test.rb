# frozen_string_literal: true

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test 'creating a player generates his factories' do
    player = Player.create!(email: 'hello2@hunter.io', password: 'azerty')

    assert player.factories.exists?(type: Factories::Gold.name)
    assert player.factories.exists?(type: Factories::Copper.name)
    assert player.factories.exists?(type: Factories::Iron.name)
  end
end
