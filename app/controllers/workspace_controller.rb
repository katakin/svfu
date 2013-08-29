# -*- encoding : utf-8 -*-
class WorkspaceController < ApplicationController
  # GET /workspace
  def index
    # @levels = Level.all
    
    # if current_user.has_role? :admin
    #   @schedules = Schedule.all
    # elsif current_user.faculty
    #   @schedules = Schedule.where :group_id => current_user.faculty.groups
    # else
    #   @schedules = Schedule.all
    # end
    if current_user.has_role? :admin
      @groups = Group.all
    elsif current_user.faculty
      @groups = Group.where :faculty_id => current_user.faculty_id
    else
      @groups = Group.all
    end
    # @groups = Group.where :faculty_id => current_user.faculty_id
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def update_level_select
    @schedules = Schedule.joins(:group).where("level_id = ?", params[:id]) unless params[:id].blank?
    render :partial => "table", :locals => { :schedules => @schedules }
  end
end