class RenameColumnParams < ActiveRecord::Migration
  def up
    rename_column :params, :param, :name
  end

  def down
    rename_column :params, :name, :param
  end
end
