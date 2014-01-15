class CreateRegistrations < ActiveRecord::Migration
  def change
  
    create_table :registrations do |t|
      t.string :username
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
