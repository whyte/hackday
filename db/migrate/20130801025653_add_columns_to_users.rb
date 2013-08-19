class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :school_company, :text
    add_column :users, :bio, :text
    add_column :users, :twitter, :string
    add_column :users, :phone, :string
    add_column :users, :part_type, :string
    add_column :users, :published, :boolean
  end
end