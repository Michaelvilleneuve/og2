# frozen_string_literal: true

class DeviseCreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end

    add_index :players, :email,                unique: true
  end
end
