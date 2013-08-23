class LevelsController < ApplicationController
  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json:  Oj.dump(@levels, mode: :compat) }
    end
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @level = Level.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /levels/new
  # GET /levels/new.json
  def new
    @level = Level.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /levels/1/edit
  def edit
    @level = Level.find(params[:id])
  end

  # POST /levels
  # POST /levels.json
  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        format.html { redirect_to @level, notice: 'Курс создан' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /levels/1
  # PUT /levels/1.json
  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to @level, notice: 'Курс изменен' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to levels_url }
      format.json { head :no_content }
    end
  end
  
  # GET /levels/rbin
  def rbin
    @levels = Level.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /levels/rbin
  def recovery
    @level = Level.find(params[:id])
    @level.update_attribute(:deleted,false)
    @level.save
    respond_to do |format|
      format.html { redirect_to levels_rbin_path, notice: 'Курс восстановлен' }
    end    
  end  
end