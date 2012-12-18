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
    url_to_call = @service.url
    response = HTTParty.get(url_to_call)

#    parsed_json=JSON.parse(response.inspect.gsub('\"', '"'))
#    parsed_json = ActiveSupport::JSON.decode(response.inspect)
    @result=response.to_s
    puts @result
  end
end
