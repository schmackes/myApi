class AddTableServicePipelines < ActiveRecord::Migration
  def up
    create_table :servicepipelines do |t|
      t.string :name, :null=>false
    end
  end

  def down
    drop_table :servicepipelines
  end
end
