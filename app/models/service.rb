# -*- coding: utf-8 -*-
class Service < ActiveRecord::Base
 has_and_belongs_to_many :users
 has_many :params

  #returns full service URL including input parameters
  def get_full_url(req_params)
    full_url=self.url

    if self.input_params.size>0
      full_url+="?"

      self.input_params.each do |param|
        #puts "name:"+param.name+"->value:"+param.value
        if req_params.has_key? param.name #this was a dynamic param -> overwrite
          value=req_params[param.name]
        else
          value=param.value
        end

        full_url+=encode(param.name)+"="+encode(value)+"&"
      end
      full_url=full_url[0..-2] #remove last &
    end

    return full_url
  end

  # returns the dynamic (input) params of the service
  def dynamic_params
    self.params.dynamic_param
  end

  # returns the input params of the service
  def input_params
    self.params.input_param
  end

  # returns the output params of the service
  def output_params
    self.params.output_param
  end

  # returns a hash of param_name -> param_value (e.g. for quickies call view)
  def get_key_value_params(params)
    key_value_hash=Hash.new

    params.each do |param|
      key_value_hash[param.name]=param.value
#      puts "kv:"+param.name+"->"+param.value
    end

    return key_value_hash
  end

  private

  # encodes the string for a URL
  def encode(string)
    URI.escape(string)
  end

end
