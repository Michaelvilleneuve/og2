# frozen_string_literal: true

class CreateFactories < ActiveRecord::Migration[6.1]
  def change
    create_table :factories do |t|
      t.integer :level, default: 1
      t.integer :resources, default: 0
      t.datetime :resource_updated_at, default: -> { 'CURRENT_DATE' }
      t.datetime :upgraded_at, default: -> { 'CURRENT_DATE' }
      t.string :type
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
