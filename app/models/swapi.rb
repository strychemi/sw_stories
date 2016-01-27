class Swapi

  include HTTParty

  BASE_URI = "http://swapi.co/api"
  
  def initialize
     
  end

  def people
    random = rand(1..87)
    response = HTTParty.get("#{BASE_URI}/people/#{random}")
    #puts response
    person_name = JSON.parse(response.body)["name"]
  end

  def planet
    random = rand(1..61)
    response = HTTParty.get("#{BASE_URI}/planets/#{random}")
    planet_name = JSON.parse(response.body)["name"]
  end

  def vehicle
    vehicle_name = nil

    until !vehicle_name.nil?
      random = rand(1..39)
      puts "Random in vehicle is #{random}"
      response = HTTParty.get("#{BASE_URI}/vehicles/#{random}")
      vehicle_name = JSON.parse(response.body)["name"]
    end  
    vehicle_name
  end

  def starship
    random = rand(1..37)
    response = HTTParty.get("#{BASE_URI}/starships/#{random}")
    starship_name = JSON.parse(response.body)["name"]
  end

  def species
    random = rand(1..37)
    response = HTTParty.get("#{BASE_URI}/species/#{random}")
    species_name = JSON.parse(response.body)["name"]
  end

  def generate_prompt
    "#{people} is at #{planet} riding on a #{vehicle} heading towards a #{starship} filled with #{species}s"
  end  
end
