# frozen_string_literal: true

module FactoriesHelper
  def readable_factory_name(factory)
    factory.type.split('::')[1]
  end
end
