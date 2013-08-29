# -*- encoding : utf-8 -*-
class RoomsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /rooms
  # GET /rooms.json
  def index
    # @rooms = Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@rooms, mode: :compat) }
    end
  end

  # GET /rooms/1
  def show
    # @room = Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /rooms/new
  def new
    # @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /rooms/1/edit
  def edit
    # @room = Room.find(params[:id])
  end

  # POST /rooms
  def create
    # @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_url, notice: 'Кабинет создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /rooms/1
  def update
    # @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to rooms_url, notice: 'Кабинет изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /rooms/1
  def destroy
    # @room = Room.find(params[:id])
    if @room
        @room.deleted = true
        @room.save
    end

    respond_to do |format|
      format.html { redirect_to rooms_url }
    end
  end
  
  # GET /rooms/rbin
  def rbin
    @rooms = Room.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /rooms/rbin
  def recovery
    @room = Room.find(params[:id])
    @room.update_attribute(:deleted,false)
    @room.save
    respond_to do |format|
      format.html { redirect_to rooms_rbin_path, notice: 'Кабинет восстановлен' }
    end    
  end
end
