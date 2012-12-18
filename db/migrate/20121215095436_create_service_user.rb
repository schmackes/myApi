class CreateServiceUser < ActiveRecord::Migration
  def up
    create_table 'services_users' do |t|
      t.references 'services'
      t.references 'users'
      t.string 'param'
      t.string 'value'
      t.timestamps
    end
  end

  def down
    drop_table 'services_users'
  end
end
