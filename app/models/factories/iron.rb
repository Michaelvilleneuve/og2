# frozen_string_literal: true

module Factories
  class Iron < Factory
    UPGRADE_RATE = :second
    LEVELS = {
      1 => {
        production_per_second: 10,
        upgrade_cost: [
          [Factories::Iron, 300],
          [Factories::Copper, 100],
          [Factories::Gold, 1]
        ]
      },
      2 => {
        production_per_second: 20,
        upgrade_cost: [
          [Factories::Iron, 800],
          [Factories::Copper, 250],
          [Factories::Gold, 2]
        ]
      },
      3 => {
        production_per_second: 40,
        upgrade_cost: [
          [Factories::Iron, 1600],
          [Factories::Copper, 500],
          [Factories::Gold, 4]
        ]
      },
      4 => {
        production_per_second: 80,
        upgrade_cost: [
          [Factories::Iron, 3000],
          [Factories::Copper, 1000],
          [Factories::Gold, 8]
        ]
      },
      5 => {
        production_per_second: 150
      }
    }.freeze
  end
end
