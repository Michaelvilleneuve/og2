# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :players
  root to: 'factories#index'
  resources :factories, only: :index do
    put :upgrade
  end
end
