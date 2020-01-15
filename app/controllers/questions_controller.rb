class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show create destroy]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.model == 'Question' ? rescue_with_question_not_found(exception.id) : raise
  end

  def index
    @questions = @test.questions

    render plain: @questions.inspect
  end

  def show
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    @question.destroy

    redirect_to test_questions_path, notice: 'Question was successfuly deleted'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found(id)
    render plain: "Question #{id} was not found"
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:test_id, :body)
  end
end
