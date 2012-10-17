class AnswersController < ApplicationController

  respond_to :html
  
  def index
    @answers = Answer.order('created_at')
  end
  
  def new
    @answer = Answer.new(params[:answer])
  end
  
  def create
    @answer = Answer.new(params[:answer])
    @answer.save
    respond_with(@answer)
  end
  
  def show
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end

end
