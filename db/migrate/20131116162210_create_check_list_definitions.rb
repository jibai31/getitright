class CreateCheckListDefinitions < ActiveRecord::Migration
  def change
    create_table :check_list_definitions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :check_list_definitions, :name
  end
end
