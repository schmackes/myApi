class QuickiesController < ApplicationController
  require 'httparty'

  def index
    @quickies=Service.all
  end


  def show
  end

   #runs the service
  def call
    @service = Service.find(params[:id])
    url_to_call = @service.get_full_url  #to be enhanced with parameters...
    #jsonResponse = Helper.doHttpCall(url_to_call, :get)

    #overwrite with additional parameters from current request
    url_to_call+="&"
    url_to_call+=params[:myParams]
    puts "debug:" + url_to_call.to_s
    response = HTTParty.get(url_to_call)

    @result_hash=response.parsed_response
  end
end
