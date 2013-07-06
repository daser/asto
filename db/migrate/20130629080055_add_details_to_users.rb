class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :coyname, :string
    add_column :users, :position, :string
    add_column :users, :coyemail, :string
    add_column :users, :mobile, :string
    add_column :users, :paidflag, :integer,:null => false, :default => 0
  end
end
