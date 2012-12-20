class Param < ActiveRecord::Base
 belongs_to :service

  scope :input_param, where(:param_type=>:input)
  scope :output_param, where(:param_type=>:output)
end
