require_relative 'class_project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do 
    @project1 = Project.new('Project 1', 'description 1', 'owner') # create a new project and make sure we can set the name attribute
  end
  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end 
  it 'has a getter and setter for owner attribute' do
    @project1.owner = 'Changed owner'
    expect(@project1.owner).to eq("Changed owner")
  end

  it 'has a method add_task that adds tasks to project and tasks that output an array of tasks' do
    @project1.add_tasks("write tests")
    expect(@project1.tasks).to eq(["write tests"])
  end

  it 'has a method print_tasks that prints each task' do
    @project1.add_tasks('1')
    @project1.add_tasks('2')
    expect{ @project1.print_tasks }.to output("1\n2\n").to_stdout
  end
end