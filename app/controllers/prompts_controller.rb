class PromptsController < ApplicationController

  def generate
    @prompt = Swapi.new.generate_prompt
  end

  def index
    #@user = User.find(:id)
    @prompts = Prompt.find_all(current_user)
  end

  def create
    @prompt = Prompt.new(text: params[:prompt], user_id: current_user.id)
    if @prompt.save
      redirect_to user_prompts_path 
    else
     flash[:error] = "Prompt not saved!"
    end  
  end 
end
