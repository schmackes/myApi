class RemoveAttributesFromServicesUsers < ActiveRecord::Migration
  def up
    remove_column :services_users, :param
    remove_column :services_users, :value
  end

  def down
    add_column :services_users, :param
    add_column :services_users, :value
  end
end
