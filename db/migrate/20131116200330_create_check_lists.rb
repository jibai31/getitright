class CreateCheckLists < ActiveRecord::Migration
  def change
    create_table :check_lists do |t|
      t.string :name
      t.references :user, index: true
      t.references :check_list_definition, index: true

      t.timestamps
    end
    add_index :check_lists, :name
  end
end
