class StatsController < ApplicationController

  def index
    @flights = Flight.all
    @stats = Stat.all

    @dates = Array.new
    @stats.each do |stat|
      @dates.push(stat.created_at)
    end

    @dates = @dates.uniq
  end

end
