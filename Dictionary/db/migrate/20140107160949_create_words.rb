class CreateWords < ActiveRecord::Migration
  def change
  
    create_table :words do |t|
      t.string :word
      t.text :description
      t.string :language
      t.integer :votes
      t.integer :downvotes
      t.string :author

      t.timestamps
    end
  end
end
