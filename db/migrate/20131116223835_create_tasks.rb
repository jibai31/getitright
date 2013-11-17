class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :step
      t.boolean :done
      t.references :task_definition, index: true
      t.references :check_list, index: true

      t.timestamps
    end
  end
end
