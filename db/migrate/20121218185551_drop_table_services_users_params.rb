class DropTableServicesUsersParams < ActiveRecord::Migration
  def up
    drop_table :services_users_params
  end

  def down
    #does not exist
  end
end

