class AddIndexAtListAndTask < ActiveRecord::Migration
  def up
	add_index(:lists, :user_id)
	add_index(:tasks, :list_id)
  end

  def down
  end
end
