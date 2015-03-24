require 'rails_helper'

feature 'Existing users can CRUD Projects' do
  scenario 'index lists all available projects by name' do
    project = Project.new(name: 'gSchool, yo')
    project.save!

    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    expect(page).to have_content "gSchool, yo"
  end

  scenario 'user can create new project' do
    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    within ".page-header" do
      click_link 'New Project'
    end
    click_button 'Create Project'
    expect(page).to have_content 'Name can\'t be blank'

    fill_in :project_name, with: 'Find Fountain of Youth'
    click_button 'Create Project'

    expect(page).to have_content 'Find Fountain of Youth'
    expect(page).to have_content 'Project was successfully created'
  end

  scenario 'user can edit project' do
    project = Project.new(name: 'gSchool, yo')
    project.save!

    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    click_link 'gSchool, yo'
    click_link 'Edit'
    fill_in :project_name, with: 'gSchool, yo updated, yo'
    click_button 'Update Project'
    expect(page).to have_content 'gSchool, yo updated, yo'
    expect(page).to have_content 'Project was successfully updated'
  end

  scenario 'user can delete project' do
    project = Project.new(name: 'gSchool, yo')
    project.save!

    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    click_link 'gSchool, yo'
    click_link 'Delete'
    expect(page).to have_content 'Project was successfully deleted'
  end
end

feature 'Users who are not signed in can not see Projects page' do
  scenario 'user tries to see projects page and is redirected to sign_in page' do
  visit projects_path
  expect(page).to have_content 'You must sign in'
  end
end
