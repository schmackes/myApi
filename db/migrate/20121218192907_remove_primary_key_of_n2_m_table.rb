class RemovePrimaryKeyOfN2MTable < ActiveRecord::Migration
  def up
    remove_column :services_users, :id
  end

  def down
  end
end
