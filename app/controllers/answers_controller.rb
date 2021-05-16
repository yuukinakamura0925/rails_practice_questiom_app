class AnswersController < ApplicationController
  def create
    # userモデルにhas_many
    @answer = current_user.answers.build(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      # show.htmlに@questionがあるのでとってきてrenderする必要がある
      # @question = Question.find(params[:question_id])
      # render "questions/show"
      redirect_to question_path(params[:question_id])
      # リダイレクトしてしまう手もある
    end
  end

  def destroy
    @answer = current_user.answers.find(params[:id])
    @answer.destroy!
    redirect_to question_path(params[:question_id])
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
