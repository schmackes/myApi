class CreateServicePipelines < ActiveRecord::Migration
  def change
    create_table :service_pipelines do |t|

      t.timestamps
    end
  end
end
