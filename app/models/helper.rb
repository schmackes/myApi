class Helper

  ##
  # This method extracts values from the json as "addressed" in the values of the param_hash.
  #
  # param_hash
  #   - keys (e.g. distance) and
  #   - values (e.g. rows 0 element 0 distance test )
  # json: json hash
  #
  # returns result_hash with
  # - keys as provided by input
  # - value: extracted json value
  def self.extract_from_json(param_hash, json)
    result_hash=Hash.new

    param_hash.each do |key,address_string|
      json_copy=json#JSON.parse(json.to_s)
      split_array=address_string.split
      address_array=convert_string_numbers_to_real_numbers(split_array)

      address_array.each {|i| json_copy=json_copy[i]}

      result_hash[key]=json_copy
    end

    return result_hash
  end

  #convert string numbers to real number (e.g. "0" to 0)
  def self.convert_string_numbers_to_real_numbers(input_array)
    output_array=Array.new
    input_array.each do |i|
      if self.is_numeric? i
          output_array << i.to_i
        else
          output_array << i
        end
    end

    return output_array
  end

  def self.is_numeric?(object)
    true if Float(object) rescue false
  end



end
