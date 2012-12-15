class QuickyController < ApplicationController
  require 'httparty'

  def show
  end

   #runs the service
  def call
    full_url = ServiceObject.get_url_by_id(params[:id])
    response = HTTParty.get(full_url)

#    parsed_json=JSON.parse(response.inspect.gsub('\"', '"'))
#    parsed_json = ActiveSupport::JSON.decode(response.inspect)
    @result=response.to_s
    puts @result
  end
end
