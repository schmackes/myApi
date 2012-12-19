require 'spec_helper'

describe Service do
  before(:each) do
    service_name, service_desc, @service_url="dummyService","this is a dummy desc","http://www.dummy.de/search"
    @service=Service.new(:name=>service_name, :description=>service_desc, :url=>@service_url)
  end

  it "should return a valid url in case of params" do
    name1,name2,value1,value2="searchFor","filter","markus","true"
    param1=Param.new(:name=>name1, :value=>value1)
    param2=Param.new(:name=>name2, :value=>value2)

    @service.params << param1
    @service.params << param2
    param1.save
    param2.save
    @service.save

    @service.get_full_url.should include(name1+"="+value1)
    @service.get_full_url.should include(name2+"="+value2)

    exp_pattern=Regexp.new("^"+@service_url+"?")
    @service.get_full_url.should match(exp_pattern)
  end

  it "should return a valid url in case of no params" do
    exp_pattern=Regexp.new("^"+@service_url+"$")
    @service.get_full_url.should match(exp_pattern)
  end

  it "should return a valid url in case of params with special signs (e.g. space)" do
    name1,name2,value1,value2="searchFor","filter","Dummy Road 17-1000 Berlin","100,200"
    param1=Param.new(:name=>name1, :value=>value1)
    param2=Param.new(:name=>name2, :value=>value2)

    @service.params << param1
    @service.params << param2
    param1.save
    param2.save
    @service.save


    @service.get_full_url.should include(name1+"=Dummy%20Road%2017-1000%20Berlin")
    @service.get_full_url.should include(name2+"=100,200")

    exp_pattern=Regexp.new("^"+@service_url+"?")
    @service.get_full_url.should match(exp_pattern)
  end
end
