class UpdateColumnInformationParams < ActiveRecord::Migration
  def up
    Param.reset_column_information
  end

  def down
  end
end
