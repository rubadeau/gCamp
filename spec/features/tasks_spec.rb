require 'rails_helper'

feature 'Tasks' do

  before :each do
    User.destroy_all
  end

  scenario 'can see task index page' do

    task = Task.create!(
    description: "write more tests",
    due_date: "2015-03-05"
    )

    visit tasks_path
    expect(page).to have_content "write more tests"
    expect(page).to have_content "03/05/2015"
    end

    scenario 'can create new task' do

      visit tasks_path
      click_on "New Task"
      expect(page).to have_content "New Task"

      fill_in :task_description, with: "write even more tests"
      fill_in :task_due_date, with: "2015/03/05"
      click_button "Create Task"

      expect(page).to have_content "Task was successfully created!"
      expect(page).to have_content "write even more tests"
      expect(page).to have_content "03/05/2015"
    end

    scenario 'can edit task' do

      task = Task.create!(
      description: "when you think you have enough, write more tests",
      due_date: "2015-03-05"
      )

      visit tasks_path
      click_on 'Edit'

      expect(page).to have_content "Task was successfully updated!"
      expect(page).to have_content "when you think you have enough, write more tests"
      expect(page).to have_content "03/05/2015"
    end

    scenario 'can delete task' do

      task = Task.create!(
      description: "when you think you have enough, write more tests",
      due_date: "2015-03-05"
      )

      visit tasks_path
      click_on "Delete"
    end

    scenario 'has validations' do

      visit new_task_path
      fill_in :task_due_date, with: "2015/03/05"
      click_button "Create Task"
      expect(page).to have_content "1 error prohibited this post from being saved:"
    end
end
