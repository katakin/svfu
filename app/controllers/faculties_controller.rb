# -*- encoding : utf-8 -*-
class FacultiesController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /faculties
  # GET /faculties.json
  def index
    # @faculties = Faculty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@faculties, mode: :compat) }
    end
  end

  # GET /faculties/1
  def show
    # @faculty = Faculty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /faculties/new
  def new
    # @faculty = Faculty.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /faculties/1/edit
  def edit
    # @faculty = Faculty.find(params[:id])
  end

  # POST /faculties
  def create
    # @faculty = Faculty.new(params[:faculty])

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to faculties_url, notice: 'Факультет создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /faculties/1
  def update
    # @faculty = Faculty.find(params[:id])

    respond_to do |format|
      if @faculty.update_attributes(params[:faculty])
        format.html { redirect_to faculties_url, notice: 'Факультет изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /faculties/1
  def destroy
    # @faculty = Faculty.find(params[:id])
    if @faculty
        @faculty.deleted = true
        @faculty.save
    end

    respond_to do |format|
      format.html { redirect_to faculties_url }
    end
  end
  
  # GET /faculties/rbin
  def rbin
    @faculties = Faculty.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /faculties/rbin
  def recovery
    @faculty = Faculty.find(params[:id])
    @faculty.update_attribute(:deleted,false)
    @faculty.save
    respond_to do |format|
      format.html { redirect_to faculties_rbin_path, notice: 'Факультет восстановлен' }
    end    
  end
end