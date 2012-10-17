require 'test_helper'

class AnswersControllerTest < ActionController::TestCase

  context "on get index" do
    setup { get :index }
    should respond_with :success
    should render_template :index
    should assign_to :answers
  end
  
  context "on get new" do
    setup { get :new }
    should respond_with :success
    should render_template :new
    should assign_to :answer
  end
  
  context "on post create" do
    setup { post :create, answer: FactoryGirl.attributes_for(:answer) }
    should ("redirect to index"){redirect_to answers_path}
  end
  
end
