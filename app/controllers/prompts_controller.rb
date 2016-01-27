class PromptsController < ApplicationController

  def generate
    @prompt = Swapi.new.generate_prompt
  end

  def index
    @user = User.find(:id)
    @prompts = Prompts.find(current_user)
  end

end
