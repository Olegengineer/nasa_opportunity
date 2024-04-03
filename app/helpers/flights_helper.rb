module FlightsHelper
  PLANETS_GRAVITATION = {
    "Earth" => 9.807,
    "Moon" => 1.62,
    "Mars" => 3.711
  }.freeze

  FLY_PARAMETERS = { 
    launch: [0.042, 33],
    land: [0.033, 42]
   }.freeze

  #TODO: remove after test stuff.
  LAUNCH_FUEL_CONSTANT = 0.042
  LAND_FUEL_CONSTANT = 0.033

  def calculate_launch_fuel(mass, gravitation)
    (mass * gravitation * LAUNCH_FUEL_CONSTANT - 33).to_i
  end

  def calculate_land_fuel(mass, gravitation)
    (mass * gravitation * LAND_FUEL_CONSTANT - 42).to_i
  end
end