class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
