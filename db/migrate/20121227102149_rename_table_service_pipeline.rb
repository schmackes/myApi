class RenameTableServicePipeline < ActiveRecord::Migration
  def up
    drop_table :service_pipelines
    rename_table :servicepipelines, :service_pipelines
  end

  def down
    rename_table :service_pipelines, :servicepipelines
  end
end
