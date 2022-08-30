# frozen_string_literal: true

class Player < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :factories
end
