class ProjectsController < ApplicationController

  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end
  
end
