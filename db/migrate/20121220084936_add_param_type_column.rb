class AddParamTypeColumn < ActiveRecord::Migration
  def up
    add_column :params, :type, :string
  end

  def down
    remove_column :params, :type
  end
end
