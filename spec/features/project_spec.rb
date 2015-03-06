require 'rails_helper'

feature 'Projects' do

  before :each do
    User.destroy_all
  end

  scenario 'User can see list of projects' do

    project = Project.create!(
    name: "gSchool, yo"
    )

    visit projects_path
    expect(page).to have_content("Projects")
    expect(page).to have_content("gSchool, yo")
  end

  scenario 'create project' do

    visit new_project_path
    fill_in :project_name, with: "You'd betta Recognize"
    click_button "Create Project"

    expect(page).to have_content("Project was successfully created!")
    expect(page).to have_content("You'd betta Recognize")
  end

  scenario 'edit project' do

    project = Project.create!(
    name: "gSchool, yo"
    )

    visit projects_path
    click_link "gSchool, yo"
    click_link "Edit"
    fill_in :project_name, with: "gSchool updated, yo"
    click_button "Update Project"

    expect(page).to have_content "Project was successfully updated!"
    expect(page).to have_content "gSchool updated, yo"
  end

    scenario 'delete project' do

      project = Project.create!(
      name: "gSchool, yo"
      )

      visit project_path(project)
      click_link "Delete"
      expect(page).to have_content "Project was successfully deleted"
    end

    scenario 'with validations' do

      visit new_projects_path
      fill_in :project_name, with: ""
      click_button "Create Project"
      expect(page).to have_content "1 error prohibited this post from being saved:"
    end

end
