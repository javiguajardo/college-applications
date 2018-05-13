module Uscs
  def self.state_to_cities
    cities_with_state = []

    self.us_states.each do |state|

      cities = CS.cities(state)
      cities.each do |city|
        cities_with_state.push(city + ', ' + self.state_name(state))
      end
    end

    cities_with_state.flatten
  end

  private


  def self.us_states
    CS.states(:us).keys
  end

  def self.state_name(key)
    CS.states(:us)[key]
  end
end
