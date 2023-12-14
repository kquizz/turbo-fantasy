class ContestantsController < ApplicationController
  before_action :set_contestant, only: [:show, :edit, :update, :destroy]

  def index
    @contestants = Contestant.ordered
  end
  
  def show
  end
  
  def new
    @contestant = Contestant.new
  end
  
  def create
    @contestant = Contestant.new(contestant_params)
    
    if @contestant.save
      respond_to do |format|
        format.html {redirect_to contestants_path, notice: "Contestant was successfully created"}
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contestant.update(contestant_params)
      respond_to do |format|
        format.html { redirect_to contestants_path, notice: "Contestant was successfully updated"}
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @contestant.destroy
   
    respond_to do |format|
      format.html { redirect_to contestants_path, notice: "Contestant was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_contestant
    @contestant = Contestant.find(params[:id])
  end

  def contestant_params
    params.require(:contestant).permit(:name, :birth_date, :description)
  end
end