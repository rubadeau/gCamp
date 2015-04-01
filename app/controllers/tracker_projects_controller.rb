class TrackerProjectsController < ApplicationController

  def show
    tracker_api = TrackerAPI.new
    if current_user.pivotal_tracker_token
      @project = params[:project_name]
      @stories = tracker_api.stories(current_user.pivotal_tracker_token, params[:id])
    end
  end
end
