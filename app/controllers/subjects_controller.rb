# -*- encoding : utf-8 -*-
class SubjectsController < ApplicationController
  load_and_authorize_resource
  skip_load_resource :only => [:rbin, :recovery]
  # GET /subjects
  # GET /subjects.json
  def index
    # @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@subjects, mode: :compat) }
    end
  end

  # GET /subjects/1
  def show
    # @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /subjects/new
  def new
    # @subject = Subject.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /subjects/1/edit
  def edit
    # @subject = Subject.find(params[:id])
  end

  # POST /subjects
  def create
    # @subject = Subject.new(params[:subject])

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_url, notice: 'Предмет создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /subjects/1
  def update
    # @subject = Subject.find(params[:id])

    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to subjects_url, notice: 'Предмет изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /subjects/1
  def destroy
    # @subject = Subject.find(params[:id])
    if @subject
        @subject.deleted = true
        @subject.save
    end

    respond_to do |format|
      format.html { redirect_to subjects_url }
    end
  end
  
  # GET /subjects/rbin
  def rbin
    @subjects = Subject.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /subjects/rbin
  def recovery
    @subject = Subject.find(params[:id])
    @subject.update_attribute(:deleted,false)
    @subject.save
    respond_to do |format|
      format.html { redirect_to subjects_rbin_path, notice: 'Предмет восстановлен' }
    end    
  end
end