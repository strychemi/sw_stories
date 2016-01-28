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
      flash[:success] = "Draft saved!"
      redirect_to user_prompt_draft_path(id: Draft.last.id, prompt_id: params[:prompt_id])
    else
      flash.now[:error] = "Draft not saved!"
      render :new
    end
  end

  def show
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.find(params[:id])
  end

  def edit
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.find(params[:id])
  end

  def update
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.find(params[:id])
    if @draft.update(id: params[:id], prompt_id: params[:prompt_id], story: params[:draft])
      flash[:success] = "Draft updated!"
      redirect_to user_prompt_draft_path(id: Draft.last.id, prompt_id: params[:prompt_id])
    else
      flash.now[:error] = "Draft not updated!"
      render :edit
    end
  end

  def destroy
    @prompt = Prompt.find(params[:prompt_id])
    @draft = Draft.find(params[:id])
    if @draft.destroy
      flash[:success] = "Draft deleted!"
      redirect_to user_prompt_drafts_path(prompt_id: params[:prompt_id])
    else
      flash.now[:error] = "Draft not deleted!"
      render :show
    end
  end
end
