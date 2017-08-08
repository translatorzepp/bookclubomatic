class AddCurrentToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :currently_reading, :boolean, default: false
  end
end
