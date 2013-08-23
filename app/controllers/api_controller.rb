# -*- encoding : utf-8 -*-
class ApiController < ApplicationController
    # GET /api/getgroups.json
      def getgroups
  		@groups = Group.where("faculty_id = ? AND level_id = ?", params[:faculty], params[:level])
	 	respond_to do |format|
	 		format.json { render json: Oj.dump(@groups, mode: :compat) }
	  	end
	end

    # GET /api/getschedule.json
	def getschedule
		@schedules = Schedule.where("group_id = ? AND schedules.updated_at > ?", params[:group], params[:lastsync])
		.joins(:subject,:pair,:room,:teacher,:weekday)
		.select("schedules.id, schedules.occupation, schedules.parity, subjects.name as subject_name, pairs.duration as pair_dur, rooms.building_id as building_id,rooms.name as room_name, teachers.fio, schedules.weekday_id, schedules.updated_at, schedules.deleted")
		respond_to do |format|
	 		format.json { render json: Oj.dump(@schedules, mode: :compat) }
	  	end
	end
end