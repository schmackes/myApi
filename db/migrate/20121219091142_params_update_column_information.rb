class ParamsUpdateColumnInformation < ActiveRecord::Migration
  def up
    Param.reset_column_information
#    Param.all.each do |product|
#      product.update_attributes!()
#    end
  end

  def down
  end
end
