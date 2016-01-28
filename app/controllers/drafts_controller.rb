class DraftsController < ApplicationController

  def index
    @prompt = Prompt.find(params[:prompt_id])
    @drafts = @prompt.drafts
  end

  def new
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.new
  end

  def create
    @draft = Draft.new(story: params[:draft], prompt_id: params[:prompt_id])
    if @draft.save
      flash[:success] = "Draft saved"
      redirect_to user_prompt_draft_path(id: Draft.last.id, prompt_id: params[:prompt_id])
    else
      flash.now[:error] = "Draft not saved"
      render :new
    end 
  end

  def show
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.find(params[:id])
  end
end
