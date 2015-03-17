require 'rails_helper'

describe Project do

  it "is valid with a name" do
    project=Project.new(name:'valid')
    expect(project).to be_valid
  end

  it "is not valid without a name" do
    project = Project.new(name: nil)
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

end
