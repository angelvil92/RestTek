class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.boolean :admin, default: false
      t.references :role, index: true
      
      t.timestamps null: false
    end
  end
end
