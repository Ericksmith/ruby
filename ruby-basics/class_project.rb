class Project
    attr_accessor :name, :elevator_pitch
    def initialize name, pitch
      @name = name
      @elevator_pitch = pitch
    end
end
project1 = Project.new("Project 1", "Description 1")
puts project1.name
puts project1.elevator_pitch 

project2 = Project.new("name", "pitch")
puts project2.name
puts project2.elevator_pitch