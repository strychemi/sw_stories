class Swapi

  include HTTParty

  BASE_URI = "http://swapi.co/api"

  def initialize
    @noun = {
      "people" => JSON.parse(HTTParty.get("#{BASE_URI}/people/").body)["results"],
      "planets" => JSON.parse(HTTParty.get("#{BASE_URI}/planets/").body)["results"],
      "vehicles" => JSON.parse(HTTParty.get("#{BASE_URI}/vehicles/").body)["results"],
      "starships" => JSON.parse(HTTParty.get("#{BASE_URI}/starships/").body)["results"],
      "species" => JSON.parse(HTTParty.get("#{BASE_URI}/species/").body)["results"]
    }
  end

  def get_noun(param)
    response = @noun[param].sample
    attribute = response["name"]
  end

  def generate_prompt
    people = get_noun("people")
    planet = get_noun("planets")
    vehicle = get_noun("vehicles")
    starship = get_noun("starships")
    species = get_noun("species")
    "#{people} is at #{planet} riding on a #{vehicle} heading towards a #{starship} filled with #{species}s"
  end
end
