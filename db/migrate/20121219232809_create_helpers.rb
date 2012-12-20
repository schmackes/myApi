class CreateHelpers < ActiveRecord::Migration
  def change
    create_table :helpers do |t|

      t.timestamps
    end
  end
end
