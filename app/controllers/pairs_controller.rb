#encoding: utf-8
class PairsController < ApplicationController
  # GET /pairs
  # GET /pairs.json
  def index
    @pairs = Pair.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@pairs, mode: :compat) }
    end
  end

  # GET /pairs/1
  def show
    @pair = Pair.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /pairs/new
  def new
    @pair = Pair.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /pairs/1/edit
  def edit
    @pair = Pair.find(params[:id])
  end

  # POST /pairs
  def create
    @pair = Pair.new(params[:pair])

    respond_to do |format|
      if @pair.save
        format.html { redirect_to pairs_url, notice: 'Пара создана' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /pairs/1
  def update
    @pair = Pair.find(params[:id])

    respond_to do |format|
      if @pair.update_attributes(params[:pair])
        format.html { redirect_to pairs_url, notice: 'Пара изменена' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /pairs/1
  def destroy
    @pair = Pair.find(params[:id])
    if @pair
        @pair.deleted = true
        @pair.save
    end

    respond_to do |format|
      format.html { redirect_to pairs_url }
    end
  end
  
  # GET /pairs/rbin
  def rbin
    @pairs = Pair.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /pairs/rbin
  def recovery
    @pair = Pair.find(params[:id])
    @pair.update_attribute(:deleted,false)
    @pair.save
    respond_to do |format|
      format.html { redirect_to pairs_rbin_path, notice: 'Пара восстановлена' }
    end    
  end
end