class Param < ActiveRecord::Base
 belongs_to :service

  scope :input_param, where(:io_flag=>:input)
  scope :output_param, where(:io_flag=>:output)
  scope :dynamic_param, where(:ds_flag=>:dynamic)
  scope :static_param, where(:ds_flag=>:static)

end
