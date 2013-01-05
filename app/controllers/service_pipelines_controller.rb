class ServicePipelinesController < ApplicationController
  def index
    @pipelines=ServicePipeline.all
  end

  def create
    @pipeline=ServicePipeline.create!(params[:pipeline])
    flash[:notice]="#{@pipeline.name} was successfully created."
    redirect_to servicePipelines_path
  end

  def edit
    @pipeline=ServicePipeline.find(params[:id])
    puts "pipeline name:"+@pipeline.name
  end

  def update
    @pipeline=ServicePipeline.find(params[:id])
    @pipeline.update_attributes(params[:pipeline])
    redirect_to servicePipelines_path
  end
end
