class ServicesController < ApplicationController
  def index
    @services=Service.all
  end

  def new
  end

  def edit
    @service = get_service_by_id(params[:id])
  end

  def create
    @service = Service.create!(params[:service])
    flash[:notice] = "#{@service.name} was successfully created."
    redirect_to services_path
  end

  def update
    @service = get_service_by_id(params[:id])
    @service.update_attributes(params[:service])
    flash[:notice] = "#{@service.name} was successfully updated."
    redirect_to services_path
  end

  # returns a service by its id
  def get_service_by_id(id)
    if params[:id]
      Service.find(params[:id])
    else
      nil #todo error handling.
    end
  end

end
