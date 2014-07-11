class AddTextToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :text, :string
    Task.all.each do |task|
      task.text = task.task_definition.text
      task.save!
    end
  end
end
