class AddDetailsmnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mname, :string
  end
end
