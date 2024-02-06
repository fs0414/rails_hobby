class RemoveForeginKeyInComments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :articles
    rename_column :comments, :article_id, :board_id

    add_foreign_key :comments, :boards, column: :board_id
  end
end
