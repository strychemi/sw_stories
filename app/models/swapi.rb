class Swapi

  include HTTParty

  BASE_URI = "http://swapi.co/api"

  def initialize
    @nouns = {
      "people" => JSON.parse(HTTParty.get("#{BASE_URI}/people/").body)["count"],
      "planets" => JSON.parse(HTTParty.get("#{BASE_URI}/planets/").body)["count"],
      "vehicles" => JSON.parse(HTTParty.get("#{BASE_URI}/vehicles/").body)["count"],
      "starships" => JSON.parse(HTTParty.get("#{BASE_URI}/starships/").body)["count"],
      "species" => JSON.parse(HTTParty.get("#{BASE_URI}/species/").body)["count"]
    }
  end

  def get_noun(param)
    attribute = nil
    until !attribute.nil?
      random = rand(1..@nouns[param].to_i)
      response = HTTParty.get("#{BASE_URI}/#{param}/#{random}")
      attribute = JSON.parse(response.body)["name"]
    end
    attribute
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
