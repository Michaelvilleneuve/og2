# frozen_string_literal: true

require 'test_helper'

module Factories
  class MinersTest < ActiveSupport::TestCase
    test 'work iterates on each player' do
      Mock = Struct.new('Miners') do
        def process; end
      end
      Factories::Miners.expects(:new).with(players(:one)).returns(Mock.new)
      Factories::Miners.work
    end

    test 'process updates resources if possible' do
      player = players(:one)
      player.expects(:update_resources!).never
      Factories::Gold.any_instance.expects(:update_resources!).never
      Factories::Miners.new(player).process

      travel 61.seconds
      Factories::Gold.any_instance.expects(:update_resources!).once
      Factories::Miners.new(player).process
    end
  end
end
