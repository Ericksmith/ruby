class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :dojos, :sate, :state
  end
end
