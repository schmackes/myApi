class AddReferenceParamsToService < ActiveRecord::Migration
  def change
    add_column :params, :service_id, :integer
  end
end
