class AddColDsFlagToParams < ActiveRecord::Migration
  def change
    add_column :params, :ds_flag, :string
  end
end
