class RenameTypeInParamToParamType < ActiveRecord::Migration
  def up
    rename_column :params, :type, :param_type
  end

  def down
    rename_column :params, :param_type, :type
  end
end
