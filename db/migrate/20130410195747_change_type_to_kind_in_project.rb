class ChangeTypeToKindInProject < ActiveRecord::Migration
  def up
    rename_column :projects, :type, :kind
  end

  def down
    rename_column :projects, :kind, :type
  end
end
