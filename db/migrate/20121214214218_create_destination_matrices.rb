class CreateDestinationMatrices < ActiveRecord::Migration
  def change
    create_table :destination_matrices do |t|

      t.timestamps
    end
  end
end
