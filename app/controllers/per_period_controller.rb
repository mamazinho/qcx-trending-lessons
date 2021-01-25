class PerPeriodController < ApplicationController
  def index
    @questions = Question.select(Arel.star).joins(
      Question.arel_table.join(QuestionsAccess.arel_table).on(
        QuestionsAccess.arel_table[:question_id].eq(Question.arel_table[:id])
      ).join_sources
    ).limit(10)

    if params['period'] == "month" then
      @selected = @questions.group_by { |question| question.created_at.beginning_of_month }
    elsif params['period'] == "year" then
      @selected = @questions.group_by { |question| question.created_at.beginning_of_year }
    else
      @selected = @questions.group_by { |question| question.created_at.beginning_of_week }
    end

  end
end
