class FlightsController < ApplicationController
  # def index
  #   puts params.inspect
  #   puts params[:departure_airport_id]
  #   @dep_airport = Airport.pluck(:airport_code, :id)

  #   if params[:departure_airport_id].present?
  #     selected_depart_airport_id = params[:departing_airport_id]
  #     @arr_airport = Airport.where.not(id: selected_depart_airport_id).pluck(:airport_code, :id)
  #   else
  #     @arr_airport = Airport.pluck(:airport_code, :id)
  #   end
  # end

  def index
    @airports = Airport.all.map { |airport| [airport.airport_code, airport.id] }
    # @arr_airport = Airport.all.map { |airport| [airport.airport_code, airport.id] }
    @dep_date = Flight.distinct.order(:flight_date_time).pluck(:flight_date_time)

    if search_params_valid?
      @flights = Flight.where(flight_date_time: params[:flight_date_time])
    else
      flash[:alert] = "Please fill in all fields."
      render :index
    end
  end

  private

  def search_params_valid?
    params[:departure_airport_id].present? &&
    params[:arrival_airport_id].present? &&
    params[:flight_date_time].present? &&
    params[:ticket_count].present?
  end
end
