class FixVoteColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :votes, :topic_id, :book_id
  end
end
