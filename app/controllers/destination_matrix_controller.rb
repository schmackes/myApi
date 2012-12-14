class DestinationMatrixController < ApplicationController
  require 'httparty'
  def index
  end

  def show
    redirect_to destination_matrix_index_path
  end

  #runs the service
  def call
    full_url = DestinationMatrix.get_full_url

    response = HTTParty.get(full_url)

    #parsed_json = ActiveSupport::JSON.decode(response.inspect)

    puts "response: "+response.to_s
    redirect_to quicky_index_path

  end
end
