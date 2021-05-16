class QuestionsController < ApplicationController
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(disitinct: true)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    # current_user.questions はアソシエーション定義しないと使えない(user.rb)
    @question = current_user.questions.build(question_params)
    if @question.save
      # bootstrap使ってflashを定義（_flash_messages.html.erb)
      # flash[:success] = "質問を作成しました"
      redirect_to question_path(@question), success: "質問を作成しました"
      # 第二引数にflashをセット(application.controllerに定義)
    else
      flash.now[:danger] = "失敗しました"
      render :new
    end
  end

  def edit
    @question = current_user.questions.find(params[:id])
  end

  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
       redirect_to question_path(@question), success: "質問を更新しました"
    else
      flash.now[:danger] = "失敗しました"
      render :edit
    end
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy!
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
