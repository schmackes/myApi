require 'spec_helper'

describe Service do
  it "should return a valid url in case of no params" do
    param1=Param.new(:name=>"searchFor", :value=>"markus")
    param2=Param.new(:name=>"filter", :value=>"true")
    service=Service.new(:name=>"dummyURL", :description=>"a dummy url", :url=>"http://www.dummy.de/search")
    service.params << param1
    service.params << param2
    param1.save
    service.save

    puts "final url:"+service.get_full_url
  end

  it "should return a valid url in case of params" do
  end

  it "should return a valid url in case of params with special signs (e.g. space)" do
  end
end
