class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :statement
      t.text :text
      t.string :answer
      t.integer :daily_access
      t.string :discipline

      t.timestamps null: false
    end
  end
end
