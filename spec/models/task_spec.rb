require 'rails_helper'
describe Task do

  it "is valid with a decription" do
    task=Task.new(description:'valid')
    expect(task).to be_valid
  end

  it "is not valid without a decription" do

    task = Task.new(description: nil)
    task.valid?
    expect(task.errors[:description]).to include("can't be blank")
  end
end
