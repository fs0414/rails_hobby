class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
