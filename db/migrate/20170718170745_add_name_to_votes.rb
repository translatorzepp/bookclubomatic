class AddNameToVotes < ActiveRecord::Migration[5.1]
  def change
    add_column :votes, :voter_name, :string
  end
end
