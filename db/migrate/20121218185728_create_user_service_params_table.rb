class CreateUserServiceParamsTable < ActiveRecord::Migration
  def up
    create_table 'user_services_params' do |t|
      t.references 'user_services'
      t.references 'params'
      t.timestamps
    end
  end

  def down
    drop_table 'user_services_params'
  end
end
