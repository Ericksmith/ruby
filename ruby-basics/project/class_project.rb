class Project
    attr_accessor :name, :elevator_pitch, :owner
    # attr_writer :owner
    def initialize name, pitch, owner
      @name = name
      @elevator_pitch = pitch
      @owner = owner
      @task = []
    end

    def tasks
      @task
    end

    def add_tasks task
      @task.push(task)
    end

end
# project1 = Project.new("Project 1", "Description 1")
# puts project1.name
# puts project1.elevator_pitch 

# project2 = Project.new("name", "pitch")
# puts project2.name
# puts project2.elevator_pitch