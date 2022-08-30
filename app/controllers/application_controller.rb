# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def authenticate_player!
    return redirect_to new_player_session_path unless player_signed_in?
    preload_factories
  end

  def preload_factories
    @factories = current_player.factories
  end
end
