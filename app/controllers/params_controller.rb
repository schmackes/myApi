class ParamsController < ApplicationController

  def index
    @service=Service.find(params[:service_id])
    @params=@service.params
  end

  def new
    @service=Service.find(params[:service_id])
    @param ||=@service.params.new
  end

  def create
    @service=Service.find(params[:service_id])

    #sets foreign key accordingly
    @param=@service.params.build(params[:param])
    puts @param.to_s

    if @param.save
      flash[:notice]='Parameter successfully saved.'
      redirect_to service_params_path(@service)
    else
      render :action=>'new'
    end
  end

  def edit
    @service=Service.find(params[:service_id])
    @param=@service.params.find(params[:id])
  end

  def update
    @service=Service.find(params[:service_id])
    @param=@service.params.find(params[:id])
    @param.update_attributes(params[:param])
    redirect_to service_params_path(@service)
  end

  def destroy
  end

#  def get_io_flags
#    Param.get_io_flags
#  end
#
#  def get_ds_flags
#    Param.get_ds_flags
#  end
#

end
