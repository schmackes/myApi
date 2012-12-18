class CreateServicesUsersParams < ActiveRecord::Migration
  def up
    create_table 'services_users_params' do |t|
      t.references 'services_users'
      t.references 'params'
      t.timestamps
    end
  end

  def down
    drop_table 'services_users_params'
  end
end
