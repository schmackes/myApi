class CreateParameters < ActiveRecord::Migration
  def up
    create_table 'params' do |t|
      t.string 'param'
      t.string 'value'
      t.timestamps
    end
  end

  def down
    drop_table 'params'
  end
end
