class FlightsController < ApplicationController
    include FlightsHelper

  def calculate_fuel
    ship_mass = params[:mass].to_i
    flight_path = params[:flight_path]

    total_fuel = calculate_total_fuel(ship_mass, flight_path)
    
    render json: { total_fuel: total_fuel }
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def calculate_total_fuel(ship_mass, flight_path)
    full_weight = ship_mass

    flight_path.reverse_each do |action|
      fuel_need = calculate_additional_fuel(full_weight, action)
      full_weight += fuel_need
    end
    full_weight - ship_mass
  end

  def calculate_additional_fuel(full_mass, action)
    #TODO: Unreadable code, will be refactored.
    gravitation = PLANETS_GRAVITATION[action[1]]
    params = FLY_PARAMETERS[action[0]]
    calculated_fuel = (full_mass * gravitation * params[0] - params[1]).to_i

    return 0 if calculated_fuel <= 0

    additional_fuel = calculate_additional_fuel(calculated_fuel, action)
    calculated_fuel + additional_fuel
  end
end