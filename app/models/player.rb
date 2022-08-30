# frozen_string_literal: true

class Player < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :factories

  after_create :generate_factories

  def generate_factories
    [
      Factories::Copper,
      Factories::Gold,
      Factories::Iron
    ].each do |factory|
      factory.create!(player: self)
    end
  end
end
