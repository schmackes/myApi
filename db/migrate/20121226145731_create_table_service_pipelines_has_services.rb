class CreateTableServicePipelinesHasServices < ActiveRecord::Migration
  def up
    create_table :pipelineorders do |t|
      t.references :services
      t.references :servicepipelines
      t.integer :order
    end
  end

  def down
    drop_table :pipelinesorders
  end
end
