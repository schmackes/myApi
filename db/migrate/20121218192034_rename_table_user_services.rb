class RenameTableUserServices < ActiveRecord::Migration
  def up
    rename_table :user_services, :services_users
  end

  def down
  end
end
