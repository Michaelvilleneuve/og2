# frozen_string_literal: true

namespace :factories do
  task work: :environment do
    puts 'Starting worker'
    loop do
      Factories::Miners.work
    end
  end
end
