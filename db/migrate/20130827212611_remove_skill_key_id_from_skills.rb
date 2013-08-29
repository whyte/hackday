class RemoveSkillKeyIdFromSkills < ActiveRecord::Migration
  def up
    remove_column :skills, :skill_key_id
  end

  def down
  end
end
