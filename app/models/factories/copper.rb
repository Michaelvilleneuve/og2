# frozen_string_literal: true

module Factories
  class Copper < Factory
    LEVELS = {
      1 => {
        production_per_second: 3,
        upgrade_cost: [
          [Factories::Iron, 200],
          [Factories::Copper, 70]
        ]
      },
      2 => {
        production_per_second: 7,
        upgrade_cost: [
          [Factories::Iron, 400],
          [Factories::Copper, 150]
        ]
      },
      3 => {
        production_per_second: 14,
        upgrade_cost: [
          [Factories::Iron, 800],
          [Factories::Copper, 300]
        ]
      },
      4 => {
        production_per_second: 30,
        upgrade_cost: [
          [Factories::Iron, 1600],
          [Factories::Copper, 600]
        ]
      },
      5 => {
        production_per_second: 60
      }
    }.freeze
  end
end
