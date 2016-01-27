class PromptsController < ApplicationController

  def generate
    @prompt = Swapi.new.generate_prompt
  end

end
