require 'rails_helper'

describe Project do

  before do
    @project = Project.create!(name: "gSchool")
  end

  it 'is not vaild without a name' do
    @project.update_attributes(name: "")
    @project.valid?
    expect(@project.errors[:name]).to include("can't be blank")
  end
end
