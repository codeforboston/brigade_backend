class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :provider, :uid
      t.belongs_to :user
      t.timestamps
    end
  end
end
