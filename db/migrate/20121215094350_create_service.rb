class CreateService < ActiveRecord::Migration
  def up
    create_table 'services' do |t|
      t.string 'name'
      t.text 'description'
      t.string 'url'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table 'services'
  end
end
