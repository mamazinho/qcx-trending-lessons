class CreateQuestionsAccesses < ActiveRecord::Migration
  def change
    create_table :questions_accesses do |t|
      t.integer :question_id
      t.datetime :date
      t.integer :times_accessed

      t.timestamps null: false
    end
  end
end
