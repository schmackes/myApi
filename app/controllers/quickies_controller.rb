class QuickiesController < ApplicationController
  require 'httparty'

  def index
    @quickies=Service.all

    # get information for dynamic fields (e.g. java script, getLocation) for all services
    @dynamic_fields_hash=Hash.new

    @quickies.each do |service|
      @dynamic_fields_hash[service.id]=service.get_key_value_params(service.dynamic_params)
    end

    puts "dyn fields:"+ @dynamic_fields_hash.to_s
  end


  def show
  end

   #runs the service
  def call
    @service = Service.find(params[:id])

    # construct URL and make http call (currently only get)
    url_to_call = @service.get_full_url(params)  #to be enhanced with parameters...
    puts "URL to call:"+url_to_call
    response = HTTParty.get(url_to_call)

    # result for view
    @result_hash=Helper.extract_from_json(@service.get_key_value_params(@service.output_params),
                                          response.parsed_response)
  end


end
