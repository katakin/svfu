# -*- encoding : utf-8 -*-
class WeekdaysController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /weekdays
  # GET /weekdays.json
  def index
    # @weekdays = Weekday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@weekdays, mode: :compat) }
    end
  end

  # GET /weekdays/1
  def show
    # @weekday = Weekday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /weekdays/new
  def new
    # @weekday = Weekday.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /weekdays/1/edit
  def edit
    # @weekday = Weekday.find(params[:id])
  end

  # POST /weekdays
  def create
    # @weekday = Weekday.new(params[:weekday])

    respond_to do |format|
      if @weekday.save
        format.html { redirect_to weekdays_url, notice: 'День недели создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /weekdays/1
  def update
    # @weekday = Weekday.find(params[:id])

    respond_to do |format|
      if @weekday.update_attributes(params[:weekday])
        format.html { redirect_to weekdays_url, notice: 'День недели изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /weekdays/1
  def destroy
    # @weekday = Weekday.find(params[:id])
    if @weekday
        @weekday.deleted = true
        @weekday.save
    end

    respond_to do |format|
      format.html { redirect_to weekdays_url }
    end
  end
  
  # GET /weekdays/rbin
  def rbin
    @weekdays = Weekday.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /weekdays/rbin
  def recovery
    @weekday = Weekday.find(params[:id])
    @weekday.update_attribute(:deleted,false)
    @weekday.save
    respond_to do |format|
      format.html { redirect_to weekdays_rbin_path, notice: 'День недели восстановлен' }
    end    
  end
end