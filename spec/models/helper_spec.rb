# -*- coding: utf-8 -*-
require 'spec_helper'

describe Helper do

  it "should convert string number to numbers" do
    s_array=["this","is","a","0","1","-1","test","1000","array"]
    expected_array=["this","is","a",0,1,-1,"test",1000,"array"]

    resulting_array=Helper.convert_string_numbers_to_real_numbers(s_array)
    resulting_array.should =~ expected_array
  end

  it "should return true for numeric strings" do
    Helper.is_numeric?("1").should be_true
    Helper.is_numeric?("string").should be_false
  end

  it "should extract the correct distance and duration out of the json" do
    json='{
   "destination_addresses" : [ "Berlin, Deutschland" ],
   "origin_addresses" : [ "Otto-Schütz-Weg 7, 8050 Zürich, Schweiz" ],
   "rows" : [
      {
         "elements" : [
            {
               "distance" : {
                  "text" : "847 km",
                  "value" : 846928
               },
               "duration" : {
                  "text" : "7 Stunden, 47 Minuten",
                  "value" : 28038
               },
               "status" : "OK"
            }
         ]
      }
   ],
   "status" : "OK"
    }'

    param_hash=Hash["distance"=>"rows 0 elements 0 distance text",
                        "duration"=>"rows 0 elements 0 duration text"]

    # expected result
    expected_distance="847 km"
    expected_duration="7 Stunden, 47 Minuten"
    expected_hash=Hash["distance"=>expected_distance, "duration"=>expected_duration]

    # run & check
    resulting_hash=Helper.extract_from_json(param_hash,json)

    resulting_hash.should have_key("distance")
    resulting_hash.should have_key("duration")
    resulting_hash["distance"].should eql(expected_hash["distance"])
    resulting_hash["duration"].should eql(expected_hash["duration"])
  end
end
