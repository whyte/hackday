class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :user_id
      t.string :value
      t.integer :skill_key_id
      
      t.timestamps
    end
  end
end
