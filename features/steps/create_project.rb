class CreateProject < Spinach::FeatureSteps
  Given 'I signin as a user' do
    login_as :user
  end

  When 'I visit new project page' do
    visit new_project_path
  end

  And 'fill project form with valid data' do
    fill_in 'project_name', :with => 'NewProject'
    fill_in 'project_code', :with => 'NPR'
    fill_in 'project_path', :with => 'newproject'
    click_button "Create project"
  end

  Then 'I should see project page' do
    current_path.should == project_path(Project.last)
    page.should have_content('NewProject')
  end

  And 'I should see empty project instuctions' do
    page.should have_content "git init"
    page.should have_content "git remote"
    page.should have_content Project.last.url_to_repo
  end
end
