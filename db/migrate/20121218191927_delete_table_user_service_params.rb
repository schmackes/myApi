class DeleteTableUserServiceParams < ActiveRecord::Migration
  def up
    drop_table "user_services_params"
  end

  def down
  end
end
