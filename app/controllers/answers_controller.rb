class AnswersController < ApplicationController

  respond_to :html
  
  def index
    @answers = Answer.order('created_at desc').limit(25)
  end
  
  def new
    @answer = Answer.new(params[:answer])
  end
  
  def create
    @answer = Answer.new(params[:answer])
    if verify_recaptcha(model: @answer, message: 'Please confirm you are a human') && @answer.save
      redirect_to action: :index
    else
      respond_with(@answer)
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end
  
  # GET /answers/word_cloud.js
  def word_cloud
    found_words = Set.new
    word_frequency = Hash.new
    Answer.find_each do |a|
      answer_words = a.body.downcase.gsub(/^\w /,'').split(" ")
      for word in answer_words
        found_words << word
        if word_frequency[word]
          word_frequency[word] = word_frequency[word] + 1
        else
          word_frequency[word] = 1
        end
      end
    end
    @words = word_frequency
    respond_to do |format|
      format.js
    end
  end

end
