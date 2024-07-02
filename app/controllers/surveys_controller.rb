class SurveysController < ApplicationController
  before_action :set_survey, only: %i[edit update destroy show]

  def index
    @surveys = Survey.paginate(page: params[:page], per_page: 5)
    respond_to do |format|
      format.html
      format.json { render json: @surveys }
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    respond_to do |format|
      if @survey.save
        format.html { redirect_to edit_survey_path(@survey) }
        format.json { render json: @survey, status: :created }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @survey = Survey.find(params[:id])
  end

  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey }
        format.json { render json: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @survey }
    end
  end

  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_path, notice: 'Survey was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :description)
  end
end
