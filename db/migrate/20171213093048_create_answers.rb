class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.bigint :qid
      t.string :answer

      t.timestamps
    end
  end
end
