class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :asked_by
      t.datetime :created_at

      t.timestamps
    end
  end
end
