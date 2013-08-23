class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Oj.dump(@groups, mode: :compat) }
    end
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /groups/new
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Группа создана' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /groups/1
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Группа изменена' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /groups/1
  def destroy
    @group = Group.find(params[:id])
    if @group
        @group.deleted = true
        @group.save
    end
    respond_to do |format|
      format.html { redirect_to groups_url }
    end
  end
  
  # GET /groups/rbin
  def rbin
    @groups = Group.where(:deleted => true)

    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  # POST /groups/rbin
  def recovery
    @group = Group.find(params[:id])
    @group.update_attribute(:deleted,false)
    @group.save
    respond_to do |format|
      format.html { redirect_to groups_rbin_path, notice: 'Группа восстановлена' }
    end    
  end
end
