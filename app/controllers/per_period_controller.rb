class PerPeriodController < ApplicationController
  def index
    @questions = Question.select(Arel.star).joins(
      Question.arel_table.join(QuestionsAccess.arel_table).on(
        QuestionsAccess.arel_table[:question_id].eq(Question.arel_table[:id])
      ).join_sources
    ).limit(10)

    # puts(QuestionsAccess.group("month(created_at)").count)
    # puts(@questions.group("month(created_at)").count)
    for question in @questions do
      puts(question['created_at'].to_s)
    end
  end
end
