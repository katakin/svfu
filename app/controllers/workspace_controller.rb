# -*- encoding : utf-8 -*-
class WorkspaceController < ApplicationController
  # GET /workspace
  def index
    @levels = Level.all
    @schedules = Schedule.all
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def update_level_select
    @schedules = Schedule.joins(:group).where("level_id = ?", params[:id]) unless params[:id].blank?
    render :partial => "table", :locals => { :schedules => @schedules }
  end
end