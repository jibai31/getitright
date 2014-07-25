class AddStatusToChecklist < ActiveRecord::Migration
  def change
    add_column :check_lists, :status, :string
    add_index :check_lists, :status
  end
end
