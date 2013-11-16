class CreateTaskDefinitions < ActiveRecord::Migration
  def change
    create_table :task_definitions do |t|
      t.references :check_list_definition, index: true
      t.integer :step
      t.string :text

      t.timestamps
    end
  end
end
