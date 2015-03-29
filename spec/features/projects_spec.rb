require 'rails_helper'

feature 'Existing users can CRUD Projects' do
  scenario 'index lists all available projects by name' do
    User.destroy_all
    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    within ".page-header" do
      click_link 'New Project'
    end

    fill_in :project_name, with: 'first try'
    click_button 'Create Project'

    expect(page).to have_content 'first try'
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

    fill_in :project_name, with: 'Basecamp is rad, yo'
    click_button 'Create Project'

    expect(page).to have_content 'Basecamp is rad, yo'
    expect(page).to have_content 'Project was successfully created'
  end

  scenario 'user can edit project' do
    User.destroy_all
    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    within ".page-header" do
      click_link 'New Project'
    end

    fill_in :project_name, with: 'gCamp is radder, yo'
    click_button 'Create Project'

    expect(page).to have_content 'gCamp is radder, yo'
    expect(page).to have_content 'Project was successfully created'
  end

  scenario 'user can delete project' do
    User.destroy_all
    sign_in_user
    expect(page).to have_content 'Test User'
    click_link 'Projects'
    within ".page-header" do
      click_link 'New Project'
    end

    fill_in :project_name, with: 'gCamp is radder, yo'
    click_button 'Create Project'

    expect(page).to have_content 'gCamp is radder, yo'
    expect(page).to have_content 'Project was successfully created'
    within ".nav" do
      click_link 'gCamp is radder, yo'
    end

    click_link 'Delete'
  end
end

feature 'Users who are not signed in can not see Projects page' do
  scenario 'user tries to see projects page and is redirected to sign_in page' do
  visit projects_path
  expect(page).to have_content 'You must sign in'
  end
end
