class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: {question: Question.order(created_at: :desc)}
  end

  def show
    render json: {question: Question.where(id: params[:id])}
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
      @question = Question.new(question_params)
      @question.created_at = Time.now
      if @question.save
          render json: {question: @question}
      else
          render json: {question: ""}
      end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
          render json: {question: @question}
      else
        render json: {question: ""}
      end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    render json: {question: ""}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :asked_by, :created_at, :inappropriate)
    end
end
