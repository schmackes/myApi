class CreateUser < ActiveRecord::Migration
  def up
    create_table 'users' do |t|
      t.string 'firstname'
      t.string 'lastname'
      t.string 'login'
      t.string 'pwd'
      t.timestamps
    end
  end

  def down
    drop_table 'users'
  end
end
