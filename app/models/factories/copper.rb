# frozen_string_literal: true

module Factories
  class Copper < Factory
    LEVELS = {
      1 => {
        production_per_second: 10,
        upgrade_cost: [
          [Factories::Iron, 300],
          [Factories::Copper, 100],
          [Factories::Gold, 1]
        ],
      },
      2 => {
        production_per_second: 20,
        upgrade_cost: [
          [Factories::Iron, 800],
          [Factories::Copper, 250],
          [Factories::Gold, 2]
        ],
      },
      3 => {
        production_per_second: 20,
        upgrade_cost: [
          [Factories::Iron, 800],
          [Factories::Copper, 250],
          [Factories::Gold, 2]
        ],
      },
    }.freeze
  end
end
