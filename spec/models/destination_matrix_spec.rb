require 'spec_helper'

describe DestinationMatrix do
  it "should get the dummy service object" do
    so = DestinationMatrix.get_service_object
    so.url.should=="http://maps.googleapis.com/maps/api/distancematrix/json"
    so.httpMethod.should==:get
  end

  it "should return the full url" do
    full_url = DestinationMatrix.get_full_url
    full_url.should=="http://maps.googleapis.com/maps/api/distancematrix/json?origins=Zurich&destinations=Berlin&sensor=false&mode=driving&language=de"
  end
end
