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
  end
end
