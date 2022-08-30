# frozen_string_literal: true

module Factories
  class Miners
    def self.work
      Player
        .includes(:factories)
        .find_each do |player|
        new(player).process
      end
    end

    attr_reader :player

    def initialize(player)
      @player = player
    end

    def process
      player.factories.each do |factory|
        factory.update_resources! if factory.can_update_resources?
      end
    end
  end
end
