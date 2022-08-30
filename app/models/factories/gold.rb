# frozen_string_literal: true

module Factories
  class Gold < Factory
    UPGRADE_RATE = :minute
    LEVELS = {
      1 => {
        production_per_second: 2 / 60,
        upgrade_cost: [
          [Factories::Copper, 100],
          [Factories::Gold, 2]
        ]
      },
      2 => {
        production_per_second: 3 / 60,
        upgrade_cost: [
          [Factories::Copper, 200],
          [Factories::Gold, 4]
        ]
      },
      3 => {
        production_per_second: 4 / 60,
        upgrade_cost: [
          [Factories::Copper, 400],
          [Factories::Gold, 8]
        ]
      },
      4 => {
        production_per_second: 6 / 60,
        upgrade_cost: [
          [Factories::Copper, 800],
          [Factories::Gold, 16]
        ]
      },
      5 => {
        production_per_second: 8 / 60
      }
    }.freeze
  end
end
