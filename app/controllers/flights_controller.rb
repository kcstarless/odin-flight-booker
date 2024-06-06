class FlightsController < ApplicationController
  def index
    @depart_airports = Airport.all
  end
end
