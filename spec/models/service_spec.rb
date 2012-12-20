require 'spec_helper'

describe Service do
  before(:each) do
    #common test values
    service_name, service_desc, @service_url="dummyService","this is a dummy desc","http://www.dummy.de/search"
    @name1,@name2,@value1,@value2,input_type="searchFor","filter","markus","true","input"
    @name3,@value3,output_type="outputparam","dummyJsonAddress","output"

    #object net
    @service=Service.new(:name=>service_name, :description=>service_desc, :url=>@service_url)
    @param1=Param.new(:name=>@name1, :value=>@value1, :param_type=>input_type)
    @param2=Param.new(:name=>@name2, :value=>@value2, :param_type=>input_type)
    @param3=Param.new(:name=>@name3, :value=>@value3, :param_type=>output_type)
    @service.params << @param1
    @service.params << @param2
    @service.params << @param3
    @param1.save
    @param2.save
    @param3.save
    @service.save
  end

  it "should return a valid url in case of params" do
    @service.get_full_url.should include(@name1+"="+@value1)
    @service.get_full_url.should include(@name2+"="+@value2)
    @service.get_full_url.should_not include(@name3+"="+@value3)

    exp_pattern=Regexp.new("^"+@service_url+"?")
    @service.get_full_url.should match(exp_pattern)
  end

  it "should return a valid url in case of no params" do
    # delete params
    @service.params=[]
    @service.save

    exp_pattern=Regexp.new("^"+@service_url+"$")
    @service.get_full_url.should match(exp_pattern)
  end

  it "should return a valid url in case of params with special signs (e.g. space)" do
    name4,value4,name5, value5,type="key4","Dummy Road 17-1000 Berlin","key5","100,200","input"
    param4=Param.new(:name=>name4, :value=>value4, :param_type=>type)
    param5=Param.new(:name=>name5, :value=>value5, :param_type=>type)
    @service.params << param4
    param4.save
    @service.params << param5
    param5.save
    @service.save

    @service.get_full_url.should include(name4+"=Dummy%20Road%2017-1000%20Berlin")
    @service.get_full_url.should include(name5+"=100,200")

    exp_pattern=Regexp.new("^"+@service_url+"?")
    @service.get_full_url.should match(exp_pattern)
  end

  it "should distinguish between input and output params" do
    #input params
    @service.input_params.should have(2).items

    #output params
    @service.output_params.should have(1).items
  end
end
