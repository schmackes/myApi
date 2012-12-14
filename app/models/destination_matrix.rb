class DestinationMatrix
  def self.get_service_object
    #for testing purposes, hardcode for now
    so = ServiceObject.new
    so.url="http://maps.googleapis.com/maps/api/distancematrix/json"
    so.params=Hash["origins"=>"Zurich",
      "destinations"=>"Berlin",
      "sensor"=>"false",
      "mode"=>"driving",
      "language"=>"de"
    ]
    so.httpMethod=:get

    return so
  end

  def self.get_full_url
    so=self.get_service_object
    full_url=so.url

    if so.params.size>0
      full_url+="?"

      so.params.each do |key,value|
        full_url+=key+"="+value+"&"
      end

      full_url=full_url[0..-2] #remove last &
   end


    return full_url
  end

end
