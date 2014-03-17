class AddBrigadeIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :brigade_id, :integer
  end
end
