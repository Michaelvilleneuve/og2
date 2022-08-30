# frozen_string_literal: true

class FactoriesController < ApplicationController
  before_action :authenticate_player!

  def index; end

  def upgrade
    begin
      factory.upgrade!
    rescue StandardError
      redirect_to factories_path, notice: 'Unable to upgrade factory'
    end

    redirect_to factories_path, notice: "Factory upgraded to level #{factory.level}"
  end

  private

  def factory
    @factory ||= Factory.find(params.require(:factory_id))
  end
end
