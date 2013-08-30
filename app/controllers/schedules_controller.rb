# -*- encoding : utf-8 -*-
class SchedulesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /schedules
  # GET /schedules.json
  def index
    # @schedules = Schedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@schedules, mode: :compat) }
    end
  end

  # GET /schedules/1
  def show
    # @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /schedules/new
  def new
    # @schedule = Schedule.new
    @buildings = Building.all
    @faculties = Faculty.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /schedules/1/edit
  def edit
    # @schedule = Schedule.find(params[:id])
    session[:return_to] ||= request.referer
  end

  # POST /schedules
  def create
    # @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedules_url, notice: 'Расписание создано' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /schedules/1
  def update
    # @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to session.delete(:return_to) || root_path, notice: 'Расписание изменено' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /schedules/1
  def destroy
    # @schedule = Schedule.find(params[:id])
    if @schedule
        @schedule.deleted = !@schedule.deleted
        @schedule.save
    end

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
  # GET /schedules/rbin
  def rbin
    @schedules = Schedule.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /schedules/rbin
  def recovery
    @schedule = Schedule.find(params[:id])
    @schedule.update_attribute(:deleted,false)
    @schedule.save
    respond_to do |format|
      format.html { redirect_to schedules_rbin_path, notice: 'Расписание восстановлено' }
    end    
  end
end
