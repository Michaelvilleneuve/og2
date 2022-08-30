# frozen_string_literal: true

class CreateFactories < ActiveRecord::Migration[6.1]
  def change
    create_table :factories do |t|
      t.integer :level
      t.integer :resources
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
