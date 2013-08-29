#encoding: utf-8
class BuildingsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /buildings
  # GET /buildings.json
  def index
    # @buildings = Building.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@buildings, mode: :compat) }
    end
  end

  # GET /buildings/1
  def show
    # @building = Building.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /buildings/new
  def new
    # @building = Building.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /buildings/1/edit
  def edit
    # @building = Building.find(params[:id])
  end

  # POST /buildings
  def create
    # @building = Building.new(params[:building])

    respond_to do |format|
      if @building.save
        format.html { redirect_to buildings_url, notice: 'Здание создано' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /buildings/1
  def update
    # @building = Building.find(params[:id])

    respond_to do |format|
      if @building.update_attributes(params[:building])
        format.html { redirect_to buildings_url, notice: 'Здание изменено' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /buildings/1
  def destroy
    # @building = Building.find(params[:id])
    if @building
        @building.deleted = true
        @building.save
    end

    respond_to do |format|
      format.html { redirect_to buildings_url }
    end
  end
  
  # GET /buildings/rbin
  def rbin
    @buildings = Building.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /buildings/rbin
  def recovery
    @building = Building.find(params[:id])
    @building.update_attribute(:deleted,false)
    @building.save
    respond_to do |format|
      format.html { redirect_to buildings_rbin_path, notice: 'Здание восстановлено' }
    end    
  end
end
