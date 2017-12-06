class RenameDojoColumnFromStudents < ActiveRecord::Migration
  def change
    remove_reference :students, :Dojo, index: true
    add_reference :students, :dojo, index: true
  end
end
