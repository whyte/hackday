class AddCroppedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :cropped, :boolean 
  end
end
