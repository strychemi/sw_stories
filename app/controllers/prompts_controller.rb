class PromptsController < ApplicationController

  def generate
    @prompt = Swapi.new.generate_prompt
  end

  def index
    @prompts = current_user.prompts
  end

  def create
    @prompt = Prompt.new(text: params[:prompt], user_id: current_user.id)
    if @prompt.save
      redirect_to prompts_path 
    else
     flash[:error] = "Prompt not saved!"
    end  
  end

  def destroy
    @prompt = Prompt.find(params[:id])
    if @prompt.destroy
      redirect_to prompts_path
      flash[:success] = "Prompt deleted!"
    else
      redirect_to prompts_path
      flash[:error] = "Prompt failed to delete!"
    end
  end
end
