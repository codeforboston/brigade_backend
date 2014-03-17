class DropBrigadeIdFromEvents < ActiveRecord::Migration
  
  def up
    remove_column :events, :brigade_id
  end
end
