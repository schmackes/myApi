class DeleteDestinationMatrix < ActiveRecord::Migration
  def up
    drop_table "destination_matrices"
  end

  def down
    #dont do sth
  end
end
