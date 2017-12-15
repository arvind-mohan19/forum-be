class AnswersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    render json: {answer: Answer.where(qid: params[:filter][:qid]).order(upvotes: :desc, downvotes: :asc)}
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    render json: {answer: Answer.where(qid: params[:id])}
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.created_at = Time.now
    if @answer.save
        render json: {answer: @answer}
    else
        render json: {question: ""}
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
      if @answer.update(answer_params)
        render json: {answer: @answer}
      else
        render json: {answer: ""}
      end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:qid, :answer, :created_at, :upvotes, :downvotes)
    end
end
