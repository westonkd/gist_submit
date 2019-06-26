class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.float :score
    end

    add_reference :scores, :assignment, foreign_key: true
  end
end
