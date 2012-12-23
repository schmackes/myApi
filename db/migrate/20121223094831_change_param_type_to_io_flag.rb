class ChangeParamTypeToIoFlag < ActiveRecord::Migration
  def up
    rename_column :params, :param_type, :io_flag
  end

  def down
    rename_column :params, :io_flag, :param_type
  end
end
