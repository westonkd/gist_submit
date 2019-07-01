class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.references :assignment, foreign_key: true
      t.references :user, foreign_key: true
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
