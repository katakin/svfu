# -*- encoding : utf-8 -*-
class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@teachers, mode: :compat) }
    end
  end

  # GET /teachers/1
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
  end

  # POST /teachers
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_url, notice: 'Преподаватель создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /teachers/1
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to teachers_url, notice: 'Преподаватель изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher
        @teacher.deleted = true
        @teacher.save
    end

    respond_to do |format|
      format.html { redirect_to teachers_url }
    end
  end
  
  # GET /teachers/rbin
  def rbin
    @teachers = Teacher.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /teachers/rbin
  def recovery
    @teacher = Teacher.find(params[:id])
    @teacher.update_attribute(:deleted,false)
    @teacher.save
    respond_to do |format|
      format.html { redirect_to teachers_rbin_path, notice: 'Преподаватель восстановлен' }
    end    
  end
end