class RenameServicesUsers < ActiveRecord::Migration
  def up
    rename_table :services_users, :user_services
  end

  def down
    rename_table :user_services, :services_users
  end
end
